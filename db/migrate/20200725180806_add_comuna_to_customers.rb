class AddComunaToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :comuna, :string
  end
end
