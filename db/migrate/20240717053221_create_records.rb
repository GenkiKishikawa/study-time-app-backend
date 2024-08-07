class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :study_minutes
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :category
      
      t.timestamps
    end

    add_column :records, :memo, :text
  end
end
