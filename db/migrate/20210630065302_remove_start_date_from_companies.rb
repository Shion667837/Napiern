class RemoveStartDateFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :start_date, :datetime
  end
end
