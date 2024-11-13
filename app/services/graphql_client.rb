require 'graphql/client'
require 'graphql/client/http'

module GraphqlClient
    class ZenhubHTTP < GraphQL::Client::HTTP
    def headers(context)
      { "Authorization": "Bearer #{context[:token]}" }
    end
  end

  HTTP = ZenhubHTTP.new('https://api.zenhub.com/public/graphql')
  Schema = GraphQL::Client.load_schema("zenhub_schema.json")
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

# GraphQL Queries
PipelinesQuery = Client.parse <<~'GRAPHQL'
      query($workspaceId: ID!) { ... }
  GRAPHQL

  WorkspaceSprintsQuery = Client.parse <<~'GRAPHQL'
      query($workspaceId: ID!) { ... }
  GRAPHQL

  PipelineIssuesQuery = Client.parse <<~'GRAPHQL'
      query($pipelineId: ID!, ...) { ... }
  GRAPHQL
end
