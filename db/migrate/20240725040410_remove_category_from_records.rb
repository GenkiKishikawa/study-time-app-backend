class RemoveCategoryFromRecords < ActiveRecord::Migration[7.1]
  def change
    remove_column :records, :category, :string
  end
end
