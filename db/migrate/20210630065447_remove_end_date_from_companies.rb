class RemoveEndDateFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :end_date, :datetime
  end
end
