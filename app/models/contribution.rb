class Contribution < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  belongs_to :artist, :class_name => 'User'
  # Money
  monetize :amount_cents
end
