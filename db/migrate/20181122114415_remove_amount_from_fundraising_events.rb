class RemoveAmountFromFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :fundraising_events, :amount
  end
end
