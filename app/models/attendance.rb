class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :performance
  validates :user_id, uniqueness: { scope: :performance_id,
    message: "You're already attending" }
end
