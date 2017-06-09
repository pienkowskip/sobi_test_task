require 'redis'

class SobiClient
  attr_reader :bike_id

  def initialize(bike_id, redis_client = Redis.new)
    @bike_id = bike_id
    @redis_client = redis_client
  end

  def send_message(message)
    @redis_client.rpush("bike_messages_#{@bike_id}", message)
  end
end