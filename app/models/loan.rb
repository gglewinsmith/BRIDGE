class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :fundraising_event

  has_many :repayments, dependent: :destroy

  monetize :amount_cents
  monetize :amount_owed_cents
  monetize :amount_repaid_cents
  monetize :amount_owed_to_lender_cents
end
