class Vote < ApplicationRecord
  validates :movie_title, presence: true
end
