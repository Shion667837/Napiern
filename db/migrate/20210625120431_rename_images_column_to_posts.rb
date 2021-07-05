class RenameImagesColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :images, :pictures
  end
end
