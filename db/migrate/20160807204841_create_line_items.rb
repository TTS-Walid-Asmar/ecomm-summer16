class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true, foreign_key: true, null: false
      t.references :cart, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
