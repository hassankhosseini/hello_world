require 'dalli'
host = ENV['MY_MEMCACHED_HOST']
port = ENV['MY_MEMCACHED_PORT']

options = { :namespace => "app_v1", :compress => true }
client = Dalli::Client.new("#{host}:#{port}", options)

puts "Setting my_key to 'Hello World'"
client.set('my_key', 'Hello World')

value = client.get('my_key')
puts "Reading my_key from memcached: #{value}"
