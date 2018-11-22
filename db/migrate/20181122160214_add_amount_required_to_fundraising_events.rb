class AddAmountRequiredToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_monetize :fundraising_events, :amount_required, currency: { present: false }
  end
end
