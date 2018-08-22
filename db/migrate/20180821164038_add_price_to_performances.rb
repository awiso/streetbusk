class AddPriceToPerformances < ActiveRecord::Migration[5.2]
  def change
    add_monetize :performances, :contribution, currency: { present: false }, amount: { null: true, default: nil }
  end
end
