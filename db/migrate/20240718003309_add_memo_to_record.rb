class AddMemoToRecord < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :memo, :text
  end
end
