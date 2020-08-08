class AddPersonalToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :personal, :string
  end
end
