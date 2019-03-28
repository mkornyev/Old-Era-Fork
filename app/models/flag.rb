class Flag < ApplicationRecord
    has_many :flaggings
    has_many :resources, through: :flaggings
end
