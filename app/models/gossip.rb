class Gossip < ApplicationRecord
    validates :title,
    presence: true,
    length: {minimum: 3 ,maximum: 14}

    validates :content,
    presence: true

    belongs_to :user
    has_many :tag_gossips
    has_many :tags, through: :tag_gossips
    has_many :comments

end
