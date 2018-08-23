class AddColumnToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :state, :string
  end
end
