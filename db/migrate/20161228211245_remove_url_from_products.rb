class RemoveUrlFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :url, :string
  end
end
