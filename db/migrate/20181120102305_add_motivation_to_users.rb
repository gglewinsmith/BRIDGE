class AddMotivationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :motivation, :text
  end
end
