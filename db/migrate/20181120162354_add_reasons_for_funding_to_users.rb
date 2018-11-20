class AddReasonsForFundingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reasons_for_funding, :text
  end
end
