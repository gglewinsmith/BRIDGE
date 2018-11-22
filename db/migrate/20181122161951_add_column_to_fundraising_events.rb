class AddColumnToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_monetize :fundraising_events, :amount_raised, currency: { present: false }
  end
end
