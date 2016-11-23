class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :psn_gamertag, :presence => true
  validates_uniqueness_of :psn_gamertag

  extend FriendlyId
  friendly_id :psn_gamertag, use: :slugged, :use => :history


  has_many :gameplays
  has_many :comments

  def password_required?
    new_record? ? false : super
  end

end
