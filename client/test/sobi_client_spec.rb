require 'rspec'

require 'redis'
require 'sobi_client'

RSpec.describe SobiClient, '#send_message' do
  before(:all) do
    @test_db = Redis.new(db: 12)
    @test_db.flushdb
  end

  it 'saves messages in Redis list' do
    bike_id = 1234
    client = SobiClient.new(bike_id, @test_db)
    client.send_message('first_message')
    expect(@test_db.lrange("bike_messages_#{bike_id}", 0, -1)).to eq %w(first_message)
    client.send_message('next_message')
    client.send_message('last_message')
    expect(@test_db.lrange("bike_messages_#{bike_id}", 0, -1)).to eq %w(first_message next_message last_message)
  end
end