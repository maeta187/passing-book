class BookmarksController < ApplicationController
  before_action :logged_in_user, only: [:post, :index, :edit, :update, :destroy]
  def index
    @bookmarks = Bookmark.all.includes(:user)
    # .includes(:url_users)
  end

  def new
    @bookmark = Bookmark.new
    @bookmark.urls.build
  end

  def save
    @bookmark = Bookmark.new
    @bookmark.urls.build
    @bookmark = current_user.bookmarks.new(bookmark_params)
    @bookmark.save
  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      redirect_to bookmarks_path, success: '更新に成功しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end

  def destroy
    Bookmark.find(params[:id]).destroy
    flash[:success] = "URL deleted"
    redirect_to bookmarks_path
  end
    
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:description, :title, urls_attributes: [:url, :_destroy,:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end
end