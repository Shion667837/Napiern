class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :body
      t.integer :price
      t.string :place
      t.references :user, foreign_key: true

      t.timestamps
      add_index :rooms, %i[user_id created_at]
    end
  end
end
