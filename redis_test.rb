require "redis"

# On AbarCloud, this is <ServiceName>.<ProjectName>.svc.cluster.local, for example redis.my-project.svc.cluster.local
host = ENV['MY_REDIS_HOST']

# This is usually 6379
port = ENV['MY_REDIS_PORT']

client = Redis.new(:host => host, :port => port)

puts "Setting my_key to 'Hello World'"
client.set("my_key", "Hello World")

value = client.get('my_key')
puts "Reading my_key from redis: #{value}"
