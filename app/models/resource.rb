class Resource < ApplicationRecord
    #relationships
    has_many :taggings
    has_many :tags, through: :taggings
    has_many :flaggings
    has_many :flags, through: :flaggings

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :street_1, presence: true
    validates :state, inclusion: { in: STATES_LIST.map{|a,b| b}, message: "is not valid state", allow_blank: true }
    validates :zip, presence: true, format: { with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true }
    validates :max_capacity, presence: true, numericality: { only_integer: true, greater_than: 0, allow_blank: true }

    def self.search(search)
        Resource.includes(:tags).where("resources.desc LIKE :search OR tags.name LIKE :search", search: "%#{search}%" ).references(:tags)
    end
end
