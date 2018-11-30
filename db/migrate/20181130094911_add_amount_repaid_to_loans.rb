class AddAmountRepaidToLoans < ActiveRecord::Migration[5.2]
  def change
    add_monetize :loans, :amount_repaid, currency: { present: false }
  end
end
