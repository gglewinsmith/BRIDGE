class AddLoanLengthToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :fundraising_events, :loan_length, :integer
  end
end
