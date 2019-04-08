class OutreachWorker < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :re_entrants, through: :transactions


end
