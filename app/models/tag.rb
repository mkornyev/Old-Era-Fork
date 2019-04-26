class Tag < ApplicationRecord
    has_many :taggings
    has_many :resources, through: :taggings

    scope :alphabetical, -> {order('name')}

    
end
