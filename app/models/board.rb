class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy
  validates_presence_of :title

  # === CLASS METHODS =====

  def self.all_boards(user_id)
    Board.find_by_sql("
      SELECT *
      FROM boards
      WHERE boards.user_id = #{user_id}
      ")
  end

  def self.single_board(user_id, board_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards
      WHERE boards.user_id = ? AND boards.id = ?
      ", user_id, board_id]).first
  end

  def self.create_board(user_id, board_params)
    Board.find_by_sql(["
      INSERT INTO boards(title, user_id, created_at, updated_at)
      VALUES (:title, :user_id, :created_at, :updated_at)",
      {
        title: board_params[:title],
        user_id: user_id,
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
      ])
  end

  def self.update_board(board_id, board_params)
    Board.find_by_sql (["
      UPDATE boards
      SET title = ?, updated_at = ?
      WHERE boards.id = ?
      ", board_params[:title], DateTime.now, board_id])
    end
    
  def self.delete_board(board_id)
    Board.find_by_sql(["
      DELETE FROM boards
      WHERE boards.id = ?;
    ", board_id])
  end 
end
