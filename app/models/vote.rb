class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :billboard
  
  validates :user_id, uniqueness: { scope: :billboard_id, message: 'You can only vote once!' }

end
