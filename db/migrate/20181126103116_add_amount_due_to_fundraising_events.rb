class AddAmountDueToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_monetize :fundraising_events, :amount_due, currency: { present: false }
  end
end

