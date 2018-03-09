class RemoveSubcategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :subcategories
  end
end
