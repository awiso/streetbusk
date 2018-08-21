class AddLatAndLngToPerformance < ActiveRecord::Migration[5.2]
  def change
    add_column :performances, :latitude, :float
    add_column :performances, :longitude, :float
  end
end
