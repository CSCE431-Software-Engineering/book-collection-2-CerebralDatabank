class BooksController < ApplicationController
  def index
    @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(books_path, notice: "Book created successfully")
    else
      flash.now[:alert] = "Book creation failed"
      render('new', status: 422)
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(book_path(@book), notice: "Book saved successfully")
    else
      flash.now[:alert] = "Book saving failed"
      render('edit', status: 422)
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(books_path, notice: "Book deleted successfully")
  end

  def book_params
    params.require(:book).permit(
      :title
    )
  end
end
