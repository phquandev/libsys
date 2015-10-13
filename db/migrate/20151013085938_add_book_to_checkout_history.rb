class AddBookToCheckoutHistory < ActiveRecord::Migration
  def change
    add_reference :checkout_histories, :book, index: true, foreign_key: true
  end
end