class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only:[:show, :edit, :update, :destroy]
  
  def index
    @lists = @board.lists
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

end
