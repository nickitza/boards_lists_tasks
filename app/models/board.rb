class Board < ApplicationRecord
  belongs_to :user

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
      SELECT
      FROM boards
      "])
  end

end
