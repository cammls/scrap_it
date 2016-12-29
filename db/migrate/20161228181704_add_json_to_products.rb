class AddJsonToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :json, :json
  end
end
