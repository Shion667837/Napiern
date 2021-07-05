class RemoveCoopImageFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :coop_image, :text
  end
end
