class Movie < ApplicationRecord
  scope :most_recent, -> { order(created_at: :desc).limit(20) }
end
