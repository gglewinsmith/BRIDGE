class AddStatusToFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :fundraising_events, :status, :string
  end
end
