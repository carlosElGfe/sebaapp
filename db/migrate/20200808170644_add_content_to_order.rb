class AddContentToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :content, :string
  end
end
