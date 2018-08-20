class Performance < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :photo, presence: true
end
