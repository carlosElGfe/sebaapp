class AddAlmostToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :almost, :boolean
  end
end
