class BookshelvesController < ApplicationController
  before_action :logged_in_user, only: [:post, :index, :edit, :update, :destroy]
  def index
    @bookshelves = Bookshelf.all.includes(:user)
    @bookmarks = Bookmark.all.includes(:user)

  end

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
      redirect_to new_bookmark_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  # def show
  #   @bookshelf = Article.find(params[:title])  
  # end


  private
  def bookshelf_params
    params.require(:bookshelf).permit(:user_id, :url)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end


    

end
