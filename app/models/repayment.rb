class Repayment < ApplicationRecord
  belongs_to :user
  belongs_to :fundraising_event
  belongs_to :loan

  monetize :amount_cents
end
