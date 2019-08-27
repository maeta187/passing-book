class UrlsController < ApplicationController
  def new
    @url = Url.new
    @url.book_id = params[:bookmark_id]
    @url_user_id = session[:user_id]
  end

  def create
    @url = Url.new(url_params)
    if url_params[:bookmark_id].empty?
      flash[:danger] = "ブックマークを選択して下さい"
      redirect_to bookshelves_path
    end
    if @url.save
      # bookshelf_params(ハッシュ)から:bookshelf_id(キー)を指定して、bookshelf_idのvalueを取り出す
      @bookshelf = Bookshelf.find(bookshelf_params[:bookshelf_id])
      @bookshelf.destroy if @bookshelf.present?
      redirect_to bookmarks_path, success: 'ブックマークに追加しました'
    # else
    #   flash[:danger] = "ブックマークの追加に失敗しました"
    #   redirect_to bookshelves_path
    end
  end

  private
  def url_params
    params.require(:url).permit(:bookmark_id, :url)
  end

  def bookshelf_params
    params.require(:url).permit(:bookshelf_id)
  end

end