class RemoveVotesCountFromBillboards < ActiveRecord::Migration[6.0]
  def change
    remove_column :billboards, :votes_count, :integer, null: false, default:0
  end
end
