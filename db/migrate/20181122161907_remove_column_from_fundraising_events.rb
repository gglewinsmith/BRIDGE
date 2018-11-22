class RemoveColumnFromFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :fundraising_events, :amount_required_cents
  end
end
