class BikeMessagesController < ApplicationController
  def initialize
    @redis = Rails.application.config.redis
    super
  end

  def index
    messages = BikeMessage.order(:bike_id, :id).pluck(:bike_id, :body)
    @bikes = Hash.new { |h, k| h[k] = [] }
    messages.each { |id, message| @bikes[id].push(message) }
  end
end
