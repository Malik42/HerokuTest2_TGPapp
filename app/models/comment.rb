class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  validates :content, length: { minimum: 3 }
end
