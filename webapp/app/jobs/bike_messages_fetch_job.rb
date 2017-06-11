class BikeMessagesFetchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    redis = Rails.application.config.redis
    bikes = redis.keys('bike_messages_*')
    loop do
      id, message = redis.blpop(*bikes, 1)
      break unless id
      id = Integer(id.slice(('bike_messages_'.length)..-1))
      BikeMessage.create!(bike_id: id, body: message)
    end
  end
end
