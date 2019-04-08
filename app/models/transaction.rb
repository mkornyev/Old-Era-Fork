class Transaction < ApplicationRecord
  belongs_to :outreach_worker
  belongs_to :re_entrant
  belongs_to :resource

  
end
