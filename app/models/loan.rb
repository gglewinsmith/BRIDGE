class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :fundraising_event
  monetize :price_cents
end
