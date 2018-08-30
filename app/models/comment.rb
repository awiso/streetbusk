class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :performance
  validates :comment_text, presence: true
end
