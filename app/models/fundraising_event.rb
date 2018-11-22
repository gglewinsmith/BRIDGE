class FundraisingEvent < ApplicationRecord
  belongs_to :user
  has_many :loans

  monetize :price_cents
  monetize :amount_raised_cents
end
