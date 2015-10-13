class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search]
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end

  # Create new book
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    end
  end

  # View book's profiles
  def show
    @book = Book.find(params[:id])
  end

  # Update book's attributes
  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book = Book.find(params[:id]).update(book_params)
      redirect_to books_path
    end
  end

  # Delete book
  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end

  # Checkout the book
  def check_out
    @book = Book.find_by(params[:id])
    @checkout_history = @book.checkout_histories.create(book_id: @book.id, user_id: current_user.id)
    if @checkout_history.save
      redirect_to root_path
    end
  end

  # Avaiable the book
  def avaiable_book

  end

  # # Review book's checked out
  # def check_out_review
  #   @user = CheckoutHistory.where(user_id: current_user.id)
  # end

  private
  # Set book's variable
  def book_params
    params.require(:book).permit(:isbn, :title, :description, :authors, :status)
  end
end