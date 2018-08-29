class AddSoundcloudAndYoutubeLinksToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :soundcloud, :string
    add_column :users, :youtube, :string
  end
end
