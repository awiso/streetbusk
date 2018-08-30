class AddArtistDesctoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :artist_description, :string
  end
end
