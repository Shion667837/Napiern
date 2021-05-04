class AddDetailsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_name, :string
    add_column :reservations, :room_img, :string
    add_column :reservations, :room_body, :text
  end
end
