class Y00t < ApplicationRecord
  validates :twitter_username, presence: true, uniqueness: true
  validates :twitter_user_id, presence: true, uniqueness: true
end
