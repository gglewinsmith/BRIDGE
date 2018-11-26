class AddFundraisingEventRefToRepayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :repayments, :fundraising_event, foreign_key: true
  end
end
