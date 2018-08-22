class AddPaymentoContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :payment, :jsonb
  end
end
