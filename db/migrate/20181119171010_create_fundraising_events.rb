class CreateFundraisingEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :fundraising_events do |t|
      t.string :course
      t.references :user, foreign_key: true
      t.date :date_from
      t.date :date_until
      t.string :cv
      t.string :guarantor
      t.date :payback_from
      t.date :payback_until
      t.text :career_goals

      t.timestamps
    end
  end
end
