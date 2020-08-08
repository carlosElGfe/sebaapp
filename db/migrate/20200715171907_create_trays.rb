class CreateTrays < ActiveRecord::Migration[6.0]
  def change
    create_table :trays do |t|
      t.references :order, null: false, foreign_key: true
      t.references :cookie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
