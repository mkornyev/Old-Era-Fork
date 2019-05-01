class ReEntrant < ApplicationRecord


  belongs_to :user
  has_many :transactions
  has_many :outreach_workers, through: :transactions
  # delegates
  delegate :email, to: :user, allow_nil: true
  delegate :phone, to: :user, allow_nil: true
  delegate :first_name, to: :user, allow_nil: true
  delegate :last_name, to: :user, allow_nil: true
  # Scopes
  scope :for_sow, ->(sow_id) { joins(:transactions).where('outreach_worker.id = ?', sow_id).distinct }
  scope :alphabetical, -> {includes(:user).order('users.first_name, users.last_name')}
  scope :for_neighborhood, -> (area) { where('neighborhood = ?', area)}
  scope :active,       -> { where(active: true) }
  
  def full_name
    user.first_name + " " + user.last_name
  end




end
