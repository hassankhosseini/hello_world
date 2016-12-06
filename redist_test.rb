require "redis"
host = ENV['REDIS_HOST']
port = ENV['REDIS_PORT'] || 6380

client = Redis.new(:host => host, :port => port)

puts "Setting my_key to 'Hello World'"
client.set("my_key", "Hello World")

value = client.get('my_key')
puts "Reading my_key from redis: #{value}"

puts "-----"
puts "Redis works!"
