class ChangeAvatarInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :avatar, "http://res.cloudinary.com/djvp4os8m/image/upload/v1535055537/p44vav9uvwnzgbir6ek5.png")
  end
end
