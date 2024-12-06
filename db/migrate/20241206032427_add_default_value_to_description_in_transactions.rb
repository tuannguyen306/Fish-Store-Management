class AddDefaultValueToDescriptionInTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column_default :transactions, :description, from: nil, to: "No description"
  end
end
