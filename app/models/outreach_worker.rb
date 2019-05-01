class OutreachWorker < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :re_entrants, through: :transactions

  scope :active,       -> { where(active: true) }

  # delegates
  delegate :email, to: :user, allow_nil: true
  delegate :phone, to: :user, allow_nil: true
  delegate :first_name, to: :user, allow_nil: true
  delegate :last_name, to: :user, allow_nil: true


end
