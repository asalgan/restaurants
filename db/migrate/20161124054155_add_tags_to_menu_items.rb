class AddTagsToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :tags, :text
  end
end
