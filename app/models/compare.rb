class Compare < ApplicationRecord
  validates :url1, :url2, presence: true
end
