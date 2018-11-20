class AddAmountToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :fundraising_events, :amount, :integer
  end
end
