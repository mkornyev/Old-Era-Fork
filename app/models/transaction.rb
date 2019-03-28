class Transaction < ApplicationRecord
  belongs_to :outreachWorker
  belongs_to :reEntrant
  belongs_to :resource
end
