class CreateImageCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :image_collections do |t|
      t.string :name

      t.timestamps
    end
  end
end
