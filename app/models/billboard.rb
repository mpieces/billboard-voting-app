class Billboard < ApplicationRecord
  require 'csv'
  has_many :votes

  scope :highest_vote, -> do
    # where (created_at: (Time.now - 7.days)..Time.now)
     order('votes_count DESC') 
  end


  def self.import(file)
    CSV.foreach('public/billboards.csv', headers: true) do |row|
      billboard_hash = row.to_hash
      billboard = find_or_create_by!(name: billboard_hash['name'])
      billboard.update_attributes(billboard_hash)
    end

  end

end
