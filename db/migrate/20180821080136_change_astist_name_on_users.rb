class ChangeAstistNameOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :astist_name, :artist_name
  end
end
