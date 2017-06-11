class CreateBikeMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :bike_messages do |t|
      t.integer :bike_id, index: true, null: false
      t.text :body, null: false
    end
  end
end
