class AddPostIdToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :post_id, :integer
  end
end
