class CreateRepayments < ActiveRecord::Migration[5.2]
  def change
    create_table :repayments do |t|
      t.string :state
      t.string :fundraising_event_sku
      t.monetize :amount
      t.monetize :amount, currency: { present: false }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
