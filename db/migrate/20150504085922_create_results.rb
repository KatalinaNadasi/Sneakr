class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :price
      t.string :picture_url
      t.string :title
      t.string :size
      t.references :shoe, index: true

      t.timestamps null: false
    end
    add_foreign_key :results, :shoes
  end
end
