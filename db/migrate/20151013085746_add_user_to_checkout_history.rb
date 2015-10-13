class AddUserToCheckoutHistory < ActiveRecord::Migration
  def change
    add_reference :checkout_histories, :user, index: true, foreign_key: true
  end
end
