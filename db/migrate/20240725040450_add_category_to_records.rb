class AddCategoryToRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :records, :category, foreign_key: true
  end
end
