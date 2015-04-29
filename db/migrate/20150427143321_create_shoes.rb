class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.references :brand, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
