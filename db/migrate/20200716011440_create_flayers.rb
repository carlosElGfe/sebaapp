class CreateFlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :flayers do |t|
      t.references :cooky, null: false, foreign_key: true

      t.timestamps
    end
  end
end
