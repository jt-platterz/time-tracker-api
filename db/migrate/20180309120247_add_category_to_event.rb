class AddCategoryToEvent < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :events, :subcategories
    add_reference :events, :category, foreign_key: true
  end

  def up
    Event.all.update_all(category: Category.first, subcategory_id: nil)
  end
end
