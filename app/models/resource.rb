class Resource < ApplicationRecord
    has_many :taggings
    has_many :tags, through: :taggings
    has_many :flaggings
    has_many :flags, through: :flaggings

    def self.search(search)
        Resource.includes(:tags).where("resources.desc LIKE :search OR tags.name LIKE :search", search: "%#{search}%" ).references(:tags)
    end
end
