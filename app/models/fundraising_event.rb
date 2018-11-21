class FundraisingEvent < ApplicationRecord
  belongs_to :user
  has_many :loans
  monetize :price_cents
end
