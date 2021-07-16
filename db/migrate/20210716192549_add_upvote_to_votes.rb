class AddUpvoteToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :upvote, :boolean, index: true
  end
end
