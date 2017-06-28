require 'sinatra'

get '/' do
  puts 'Hello world requested...'
  erb :index
end

get '/slow' do
  puts 'Hello world requested...'
  sleep(40)
  erb :index
end
