class Tag < ApplicationRecord
    has_many :taggings
    has_many :resources, through: :taggings

    validates :name, uniqueness: true
    
    scope :alphabetical, -> {order('name')}

    
end
