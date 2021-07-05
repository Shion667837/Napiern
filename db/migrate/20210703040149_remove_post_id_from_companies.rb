class RemovePostIdFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :post_id, :integer
  end
end
