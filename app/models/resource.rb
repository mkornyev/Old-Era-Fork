class Resource < ApplicationRecord
    #relationships
    has_many :taggings
    has_many :tags, through: :taggings
    has_many :flaggings
    has_many :flags, through: :flaggings
    STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]


    validates :name, presence: true, uniqueness: { case_sensitive: false }
    # validates :street_1, presence: true
    validates :state, inclusion: { in: STATES_LIST.map{|a,b| b}, message: "is not valid state", allow_blank: true }
    validates :zip, format: { with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true }
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil))\z/i, message: "is not a valid format"
    validates_format_of :phone, with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes or dots"


    def self.search(search)
        Resource.includes(:tags).where("lower(resources.desc) LIKE :search OR lower(tags.name) LIKE :search", search: "%#{search.downcase}%" ).references(:tags)
    end

    def address
        street_1 + "\n" + city + ", " + state + ", " + zip
    end
end
