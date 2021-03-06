class FundraisingEvent < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user

  has_many :loans, dependent: :destroy
  has_many :repayments, dependent: :destroy

  monetize :price_cents
  monetize :amount_raised_cents
  monetize :amount_due_cents
  monetize :amount_repaid_cents


  # validates :course, presence: true
  # validates :date_from, presence: true
  # validates :date_until, presence: true
  # validates :guarantor, presence: true
  # validates :payback_from, presence: true
  # validates :payback_until, presence: true
  # validates :career_goals, presence: true
  # validates :loan_length, presence: true
  # validates :price_cents, presence: true
end
