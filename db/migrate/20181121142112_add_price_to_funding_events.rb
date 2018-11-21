class AddPriceToFundingEvents < ActiveRecord::Migration[5.2]
  def change
    add_monetize :fundraising_events, :price, currency: { present: false }
  end
end
