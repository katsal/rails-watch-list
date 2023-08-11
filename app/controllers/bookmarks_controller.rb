class BookmarksController < ApplicationController
  # def index
  #   @bookmarks = Bookmark.find(params[:list_id])
  # end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(movie_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmarks = Bookmark.all
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path(@bookmark.list)

  end

  private

  def movie_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
