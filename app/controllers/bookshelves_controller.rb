class BookshelvesController < ApplicationController
  before_action :logged_in_user, only: [:post, :index, :edit, :update, :destroy]
  def index
    # ログインしているユーザーのみの情報を取得
    @bookshelves = current_user.bookshelves
    @bookmarks = current_user.bookmarks
    @url = Url.new

  end

  # def show
  #   @bookmarks = Bookmark.find(params[:id])
  # end

  def new
    @bookshelf = Bookshelf.new
  end

  def save
      @bookshelf = Bookshelf.new(user_id: params[:user_id], url: params[:data])
      @bookshelf.save
  end

  def create
    @bookshelf = current_user.bookshelves.new(bookshelf_params)
    if @bookshelf.save
      redirect_to new_bookmark_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  private
  def bookshelf_params
    params.require(:bookshelf).permit(:user_id, :url)
  end
end
