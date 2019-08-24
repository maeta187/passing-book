class BookmarksController < ApplicationController
  before_action :logged_in_user, only: [:post, :index, :edit, :update, :destroy]
  def index
    # ログインしているユーザーのみの情報を取得
    @bookmarks = current_user.bookmarks
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
      redirect_to bookmarks_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
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
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy if @bookmark.present?
    redirect_to bookmarks_path, warning: '登録を取り消しました'
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:description, :title, urls_attributes: [:url, :_destroy,:id])
  end

end