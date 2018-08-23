class ChangeAvatarInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :avatar, "https://res.cloudinary.com/dtczfskhf/image/upload/v1535063445/uos81zgosqzs3m2ua7q6.png")
  end
end
