class AddMessageToContribution < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :message, :text
  end
end
