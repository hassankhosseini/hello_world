require 'sinatra'

get '/' do
  puts 'Hello world requested...'
  erb :index
end
