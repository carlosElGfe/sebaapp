class AddAdressToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :adress, :string
  end
end
