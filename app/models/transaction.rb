class Transaction < ApplicationRecord
  belongs_to :outreach_worker
  belongs_to :re_entrant
  belongs_to :resource

  scope :for_resource,        ->(resource_id) { where(resource_id: resource_id) }
  scope :for_re_entrant,      ->(re_entrant_id) { where(re_entrant_id: re_entrant_id) }
  scope :for_outreach_worker, ->(outreach_worker_id) { where(outreach_worker_id: outreach_worker_id) }
  scope :for_neighborhood,    -> (neighborhood) { joins(:re_entrant).where('re_entrants.neighborhood = ?', neighborhood) }
  scope :this_month,          -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

end
