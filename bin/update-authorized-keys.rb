#!/usr/bin/env ruby

# Fetch Public ssh keys of all members of "webops", 
# build the authorized_keys.txt file and 
# create a PR for the file

require "json"
require "net/http"
require "open3"
require "uri"


ORG = "ministryofjustice"
TEAM_NAME = "webops"
REPO_NAME = "https://github.com/poornima-krishnasamy/cloud-platform-terraform-bastion"

GITHUB_API_URL = "https://api.github.com/graphql"

# Takes a module name, returns the value of the last release defined in the
# corresponding github repo.

def main

    json = run_query(
        json: {query: get_publickeys_query()}.to_json,
        token: ENV.fetch("GITHUB_TOKEN")
      )

  members = JSON.parse(json)
    .dig("data", "organization", "team", "members","nodes")

  authorized_keys = '' 
  members.each do |member|
    authorized_keys += "# "+format(member["name"])+"\n"
    member['publicKeys']["edges"].each do |node|
      authorized_keys += node["node"]["key"] + "\n"
    end
  end


rescue NoMethodError # we get this if we call 'dig' on nil
  # Experimental modules may not have any releases, so just return nothing
  nil
end


def run_query(params)
  token = params.fetch(:token)
  json = params.fetch(:json)

  headers = {"Authorization" => "bearer #{token}"}

  uri = URI.parse(GITHUB_API_URL)
  resp = Net::HTTP.post(uri, json, headers)

  resp.body
end


def get_repository_query()
    owner, name = REPO_NAME.sub("https://github.com/", "").split("/")
    %[
      {
        repository(owner: "#{owner}", name: "#{name}") {
          id
      }
    }
    ]
  end

  
def get_publickeys_query()
  %[
    {
        organization(login: "#{ORG}") {
            team(slug: "#{TEAM_NAME}") {
            id
            members {
                nodes {
                id
                name
                publicKeys(first: 1) {
                    edges {
                    node {
                        key
                    }
                    }
                }
                }
            }
            }
        }
    }
  ]
end

############################################################

main