class Vote < ApplicationRecord
  belongs_to :billboard
  belongs_to :user

  validates :user_id, uniqueness: { scope: :billboard_id }
end
