class AddLoanRefToRepayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :repayments, :loan, foreign_key: true
  end
end
