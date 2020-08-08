class AddCopyToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :copy, :boolean
  end
end
