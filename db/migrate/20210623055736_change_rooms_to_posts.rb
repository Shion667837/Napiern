class ChangeRoomsToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_table :rooms, :posts
  end
end
