require 'csv'
require 'json'
require 'sinatra'
require './worldmeters'

get '/worldmeters/csv' do
  scrapper = Scrappers::Worldmeters.new
  summary = scrapper.summary

  body << "#{summary.first.keys.join(';')}\n"
  summary.each { |row| body << "#{row.values.join(';')}\n" }

  body
end

get '/worldmeters/json' do
  scrapper = Scrappers::Worldmeters.new
  summary = scrapper.summary

  summary.to_json
end