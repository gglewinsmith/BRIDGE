class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :fundraising_event
  monetize :amount_cents
end
