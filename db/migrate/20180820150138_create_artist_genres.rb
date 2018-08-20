class CreateArtistGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_genres do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
