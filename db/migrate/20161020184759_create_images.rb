class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.binary :data
      t.string :name

      t.timestamps
    end
  end
end
