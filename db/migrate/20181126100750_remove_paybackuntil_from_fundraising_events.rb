class RemovePaybackuntilFromFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :fundraising_events, :payback_until, :date
  end
end
