class BooksController < ApplicationController

  def index
    @books = Book.all
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

  private
  # Set book's variable
  def book_params
    params.require(:book).permit(:isbn, :title, :description, :authors, :status)
  end
end