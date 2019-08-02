class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all.includes(:url_users)
  end

  def new
    @bookmark = Bookmark.new
    @bookmark.urls.build
  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    # logger.debug @bookmark.errors.inspect 
    # binding.pry@b
    # byebug
    if @bookmark.save
      redirect_to bookmarks_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:description, :title, urls_attributes: [:url])
  end
end