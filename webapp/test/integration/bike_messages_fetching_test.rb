require 'test_helper'

class BikeMessagesFetchingTest < ActionDispatch::IntegrationTest
  test 'fetching message from bike' do
    message = 'Zu4sA8TXzushy1Qjx5zbZWab59BSVYFf0E1itChvvdV0GLq3vmK4nbA8IN4pEs8ip4a1qNVKF0gPgnpeRP9pfDCK804lv7WrkvIgm44JdEswLt7FHFLWgrWhijzeIAH3O3fhmKgK0OPZ1F3bRH2wSRC1Upo40Ht8'
    bike_id = 1234
    Rails.application.config.redis.rpush("bike_messages_#{bike_id}", message)
    sleep 6 #waiting for web server to fetch and process message
    assert BikeMessage.exists?(bike_id: bike_id, body: message)
    get '/'
    assert_select 'h3', /\ABike.#1\z/
    assert_select 'li.message', message
  end
end
