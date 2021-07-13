class Vote < ApplicationRecord
  belongs_to :billboard, counter_cache: true
end
