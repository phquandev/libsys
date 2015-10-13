class CheckoutHistoriesController < ApplicationController
  def index
    @co_histories = CheckoutHistory.all
    @book = Book.find(params[:id])
  end

  def new
    @checkout_history = CheckoutHistory.new
  end

  def create
    @checkout_history = CheckoutHistory.create(user_id: current_user.id, book_id: params[:book_id])
    if @checkout_history.save
      redirect_to checkout_history_path
    end
  end
end