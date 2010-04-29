require 'rubygems'
require 'sinatra'
require 'rest_client'
require 'httparty'
require 'haml'
require 'sinatra/r18n'

get("/:locale/") do
  @federation = Crack::XML.parse(RestClient.get("http://localhost:4567/federations/1").body)["federation"]
  @year = 2010
  @stats = Crack::XML.parse(RestClient.get("http://localhost:4567/federations/1/stats/#{@year}").body)["stats"]
  haml :index
end
get("/"){ redirect "/en" }