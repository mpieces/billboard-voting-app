class AddVotesCountToBillBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :billboards, :votes_count, :integer, default: true
  end
end
