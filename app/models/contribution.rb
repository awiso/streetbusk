class Contribution < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  belongs_to :artist, :class_name => 'User'

  validates :message, presence: true
  # Money
  monetize :amount_cents
end
