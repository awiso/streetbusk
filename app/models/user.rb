class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artist_genres
  has_many :performances, dependent: :destroy

  has_many :attendances, dependent: :destroy
  has_many :comments

  has_many :sent_contributions, :class_name => 'Contribution', :foreign_key => 'user_id'
  has_many :received_contributions, :class_name => 'Contribution', :foreign_key => 'artist_id'


  validates :email, presence: true, uniqueness: true
  mount_uploader :avatar, PhotoUploader

end
