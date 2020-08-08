class AddTreeToTray < ActiveRecord::Migration[6.0]
  def change
    add_reference :trays, :tree, null: false, foreign_key: true
  end
end
