class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :list, uniqueness: { scope: :movie }
end
