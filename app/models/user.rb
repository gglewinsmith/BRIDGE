class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fundraising_events
  has_many :loans
  # validates :name, presence: true, uniqueness: true
  # validates :photo, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :motivation, presence: true
  # validates :linkedin, presence: true
  # validates :job, presence: true
  # validates :industry, presence: true
  # validates :reasons_for_funding, presence: true
end
