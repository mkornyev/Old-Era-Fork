class ReEntrant < ApplicationRecord
  belongs_to :user
  has_many :outreach_workers, through: :transactions

end
