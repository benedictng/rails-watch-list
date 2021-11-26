class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
    if params['keyword']
      keyword = params[:keyword]
    @lists = List.where("name LIKE ?", "%#{keyword}%")
    end
  end

  def show
  
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), alert: 'List created successfully.'
    else
      render new_list_path
    end
  end

  def update
    if @list.update!(list_params)
      redirect_to list_path(@list), alert: 'List edited successfully.'
    else
      render edit_list_path
    end
  end

  def destroy
    @list.delete
    redirect_to lists_path, alert: 'List deleted successfully.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
