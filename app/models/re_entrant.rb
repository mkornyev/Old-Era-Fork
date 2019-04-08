class ReEntrant < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :outreach_workers, through: :transactions

    # delegates
  delegate :email, to: :user, allow_nil: false
  delegate :phone, to: :user, allow_nil: true
end
