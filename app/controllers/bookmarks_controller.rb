class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    # @bookmark = Bookmark.find(params[:list])
    @list = List.find(params[:list_id])
    # raise
  end

  def create
    # chercher dans nos listes, l'id de la liste
    # /lists/7
    @list = List.find(params[:list_id])
    # creer new instance de bookmark avec des parametres
    @bookmark = Bookmark.new(bookmark_params)
    # lier avec la bonne list -> liste avec id 7, la lier avec le bookmark crée
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

    # save
    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
