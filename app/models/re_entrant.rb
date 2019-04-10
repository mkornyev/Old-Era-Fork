class ReEntrant < ApplicationRecord

  attr_accessor :email, :password, :password_confirmation

  belongs_to :user
  has_many :transactions
  has_many :outreach_workers, through: :transactions

    # delegates
  delegate :email, to: :user, allow_nil: true
  delegate :phone, to: :user, allow_nil: true
  delegate :first_name, to: :user, allow_nil: true
  delegate :last_name, to: :user, allow_nil: true


end
