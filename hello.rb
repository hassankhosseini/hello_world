require 'sinatra'

get '/' do
  puts 'Hello world requested...'
  puts Time.now.utc
  sleep(50)
  puts Time.now.utc
  erb :index
end
