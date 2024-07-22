class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :study_time
      t.integer :start_year
      t.integer :start_month
      t.integer :start_day
      t.time :start_time
      t.integer :end_year
      t.integer :end_month
      t.integer :end_day
      t.time :end_time
      t.string :category

      t.timestamps
    end
  end
end
