class AddAgecheckToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agecheck, :boolean
  end
end
