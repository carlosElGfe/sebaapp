class AddDispToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :disp, :boolean
  end
end
