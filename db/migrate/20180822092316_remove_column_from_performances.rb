class RemoveColumnFromPerformances < ActiveRecord::Migration[5.2]
  def change
    remove_column :performances, :contribution_cents, :integer
  end
end
