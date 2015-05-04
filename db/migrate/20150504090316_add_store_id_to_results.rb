class AddStoreIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :store_id, :integer
  end
end
