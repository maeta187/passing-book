class UrlsController < ApplicationController
  def new
    @url = Url.new
    @url.book_id = params[:book_id]
    @url_user_id = session[:user_id]
  end

  def creste
    @url = current_user.urls.new(url_params)
    if @book.after_save
      redirect_to books_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
end

  private
  def url_params
    params.require(:url).permit(:user_id, :book_id, :title)
  end