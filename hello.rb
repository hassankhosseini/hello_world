require 'sinatra'

get '/' do
  puts 'Hello world requested...'
  puts "Sleeping at #{Time.now.utc}"
  sleep(7)
  puts "Woke up at #{Time.now.utc}"
  erb :index
end
