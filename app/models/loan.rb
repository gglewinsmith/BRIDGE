class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :fundraising_event

  has_many :repayments, dependent: :destroy

  monetize :amount_cents
  monetize :amount_owed_cents
end
