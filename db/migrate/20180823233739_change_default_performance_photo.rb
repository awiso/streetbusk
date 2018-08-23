class ChangeDefaultPerformancePhoto < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :default_performance_photo, "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-0.3.5&s=264727722bf2479d73380e1170bb3f48&auto=format&fit=crop&w=1050&q=80")
  end
end
