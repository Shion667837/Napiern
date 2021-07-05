class AddStockpriceToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :stockprice, :string
  end
end
