class LinksController < ApplicationController
  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインして下さい"
      redirect_to login_path
    end
  end
end
