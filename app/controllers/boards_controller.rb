class BoardsController < ApplicationController

  before_action :set_board, only:[:show, :edit, :update, :destroy]

  def index
    @boards = Board.all_boards(current_user.id)
  end

  def show
  end

  def new
    @board = current_user.boards.new()
  end

  def create
    @board = Board.create_board(current_user.id, board_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private def set_board
    @board = Board.single_board(current_user.id, params[:id])
  end

end
