class AddAmountOwedLenderToLoans < ActiveRecord::Migration[5.2]
  def change
    add_monetize :loans, :amount_owed_to_lender, currency: { present: false }
  end
end
