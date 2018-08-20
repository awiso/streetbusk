class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :name, :string
    add_column :users, :artist, :boolean
    add_column :users, :astist_name, :string
    add_column :users, :default_performance_photo, :string
    add_column :users, :social_media_links, :text
  end
end
