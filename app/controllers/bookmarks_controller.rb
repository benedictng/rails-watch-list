class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new, :create]

  def index
    @bookmarks = Bookmark.all
    if params['keyword']
      keyword = params[:keyword]
    @bookmarks = Bookmark.where("name LIKE ?", "%#{keyword}%")
    end
  end

  def show

  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list), alert: 'Bookmark created successfully.'
    else
      render :new
    end
  end

  def update
    if @bookmark.update!(bookmark_params)
      redirect_to bookmark_path(@bookmark), alert: 'Bookmark edited successfully.'
    else
      render edit_bookmark_path
    end
  end

  def destroy
    @bookmark.delete
    redirect_to list_path(@bookmark.list), alert: 'Bookmark deleted successfully.'
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
