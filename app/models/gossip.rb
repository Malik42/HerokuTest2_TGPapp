class Gossip < ApplicationRecord
  belongs_to :user #, optional: true
  has_many :gossip_tags
  has_many :tags , through: :gossip_tags

  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :title, length: { maximum: 32 }
	validates :content, presence: true
  has_many :comments , dependent: :delete_all
end
