class UrlsController < ApplicationController
  def new
    @url = Url.new
    @url.book_id = params[:bookmark_id]
    @url_user_id = session[:user_id]
  end

  def create
    @url = current_user.urls.new(url_params)
    if @bookmark.after_save
      redirect_to urls_path, success: '投稿に成功しました'
    else
      render :new
    end
  end

  def show
    @link = Url.select("url")
  end

  private
  def url_params
    params.require(:url).permit(:user_id, :bookmark_id, :title)
  end
end