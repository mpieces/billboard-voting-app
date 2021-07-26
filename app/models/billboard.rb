class Billboard < ApplicationRecord
  require 'csv'
  has_many :votes

  # returns all 30 billboards
  # scope :highest_vote, -> do
  #    order(votes_count: :desc) 
  # end


  def self.import(file)
    CSV.foreach('public/billboards.csv', headers: true) do |row|
      billboard_hash = row.to_hash
      billboard = find_or_initialize_by!(name: billboard_hash['name'])
      billboard.update!(billboard_hash)
    end
  end

  def vote_score
       # 3 upvotes and 2 downvotes, 3 + (-2) = 1
       upvotes = votes.where(upvote: true).count
       downvotes = votes.where(upvote: false).count
       return upvotes + (-1 * downvotes)
  end

  # rank bb's according to time-decay algorithm
  def calculate_rank(gravity=1.8)
    item_hour_age = (Time.now - created_at) / 3600 
    return (vote_score - 1) / (item_hour_age+2) ** gravity
  end

end


# Score = (P-1) / (T+2)^G

# where,
# P = points of an item (and -1 is to negate submitters vote)
# T = time since submission (in hours)
# G = Gravity, defaults to 1.8 in news.arc