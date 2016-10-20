class AddImageCollectionIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :image_collection_id, :integer
  end
end
