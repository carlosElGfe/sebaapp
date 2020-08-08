class AddIdentToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :ident, :integer
  end
end
