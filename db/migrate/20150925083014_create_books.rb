class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :description
      t.string :authors
      t.integer :status

      t.timestamps null: false
    end
  end
end