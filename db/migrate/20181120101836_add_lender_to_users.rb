class AddLenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lender, :boolean
  end
end
