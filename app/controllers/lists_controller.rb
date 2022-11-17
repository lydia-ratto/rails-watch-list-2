class ListsController < ApplicationController

  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(params_list)
    redirect_to list_path(@list)
  end


  private

  def set_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name, :poster_url)
  end
end
