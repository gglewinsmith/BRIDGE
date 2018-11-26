class AddLoanLengthToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :loan_length, :integer
  end
end
