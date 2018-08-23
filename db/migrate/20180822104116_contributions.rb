class Contributions < ActiveRecord::Migration[5.2]
  def change
    change_table :contributions do |t|
      t.monetize :amount, currency: { present: false }
    end
  end
end
