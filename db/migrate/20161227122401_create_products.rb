class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.string :url
      t.string :brand, :default => "", :null => true
      t.string :product_id, :default => "", :null => true
      t.string :category, :default => "", :null => true

      t.timestamps
    end
  end
end
