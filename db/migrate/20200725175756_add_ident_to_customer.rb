class AddIdentToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :ident, :string
  end
end
