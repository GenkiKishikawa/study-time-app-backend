class AddCategoryToRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :records, :category, null: false, foreign_key: true
  end
end
