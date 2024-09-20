class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title, default: "", null: false
      t.text :description, default: "", null: false
      t.integer :price, default: 0, null: false

      t.timestamps
    end
  end
end
