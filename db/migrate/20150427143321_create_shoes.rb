class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :brand_id
      t.text :description
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
