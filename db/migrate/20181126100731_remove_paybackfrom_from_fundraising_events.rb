class RemovePaybackfromFromFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :fundraising_events, :payback_from, :date
  end
end
