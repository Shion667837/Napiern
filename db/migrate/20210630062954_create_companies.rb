class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.references :posts, foreign_key: true
      t.string :coop_name
      t.text :coop_body
      t.string :coop_place
      t.text :coop_image
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
