require "redis"
host = ENV['MY_REDIS_HOST']
port = ENV['MY_REDIS_PORT']

client = Redis.new(:host => host, :port => port)

puts "Setting my_key to 'Hello World'"
client.set("my_key", "Hello World")

value = client.get('my_key')
puts "Reading my_key from redis: #{value}"
