class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to books_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:description, :url, :title, :image)
  end
end