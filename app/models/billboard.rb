require 'pry'

class Billboard < ApplicationRecord
  require 'csv'
  has_many :votes

  # returns all 30 billboards
  scope :highest_vote, -> do
     order(votes_count: :desc) 
  end


  def self.import(file)
    CSV.foreach('public/billboards.csv', headers: true) do |row|
      billboard_hash = row.to_hash
      billboard = find_or_create_by!(name: billboard_hash['name'])
      billboard.update_attributes(billboard_hash)
    end
  end

  # rank bb's according to time-decay algorithm
  def calculate_rank(votes, item_hour_age, gravity=1.8)
    # billboard = Billboard.find_by(id: billboard_id)
    item_hour_age = (Time.now - billboard.created_at)/3600 
    binding.pry
    return (votes - 1) / (item_hour_age+2)**gravity
  end

end


# Score = (P-1) / (T+2)^G

# where,
# P = points of an item (and -1 is to negate submitters vote)
# T = time since submission (in hours)
# G = Gravity, defaults to 1.8 in news.arc