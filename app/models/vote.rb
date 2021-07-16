class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :billboard, counter_cache: true
  
  validates :user_id, uniqueness: { scope: :billboard_id }
  # validates :user, uniqueness: { scope: :billboard }
  # validates :billboard, uniqueness: { scope: :user }

end
