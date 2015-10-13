class CreateCheckoutHistories < ActiveRecord::Migration
  def change
    create_table :checkout_histories do |t|

      t.timestamps null: false
    end
  end
end
