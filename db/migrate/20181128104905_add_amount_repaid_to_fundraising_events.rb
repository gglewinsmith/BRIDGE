class AddAmountRepaidToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_monetize :fundraising_events, :amount_repaid, currency: { present: false }
  end
end
