class AddAmountOwedToLoans < ActiveRecord::Migration[5.2]
  def change
    add_monetize :loans, :amount_owed, currency: { present: false }
  end
end
