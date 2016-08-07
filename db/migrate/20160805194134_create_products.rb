class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.text :description
      t.integer :stock, null: false
      t.boolean :promoted

      t.timestamps null: false
    end
  end
end
