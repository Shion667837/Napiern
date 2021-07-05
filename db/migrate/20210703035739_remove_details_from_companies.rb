class RemoveDetailsFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :posts_id, :integer
    remove_column :companies, :user_id, :integer
  end
end
