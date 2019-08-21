class UrlsController < ApplicationController
  def new
    @url = Url.new
    @url.book_id = params[:bookmark_id]
    @url_user_id = session[:user_id]
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_path, success: '追加に成功しました'
    else
      render :new
    end
  end

  private
  def url_params
    params.require(:url).permit(:bookmark_id, :url)
  end
end