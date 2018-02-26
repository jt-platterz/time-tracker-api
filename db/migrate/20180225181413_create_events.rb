class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
