class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.integer :category

      t.timestamps null: false
    end
  end
end
