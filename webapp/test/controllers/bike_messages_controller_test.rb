require 'test_helper'

class BikeMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bike_messages_index_url
    assert_response :success
  end

end
