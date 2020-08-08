class CreateRoads < ActiveRecord::Migration[6.0]
  def change
    create_table :roads do |t|
      t.references :tree, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
