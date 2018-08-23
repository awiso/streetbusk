class AddPriceContributions < ActiveRecord::Migration[5.2]
  def change
    add_monetize :contributions, :price, currency: { present: false }
  end
end
