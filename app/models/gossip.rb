class Gossip < ApplicationRecord
	has_many :tags
	belongs_to :user
end
