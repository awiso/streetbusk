class AddSocialMediaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :social_media_links, :text
  end
end
