class Tagging < ApplicationRecord
  belongs_to :resource
  belongs_to :tag

  scope :for_resource,   ->(resource_id) { where(resource_id: resource_id) }
  scope :for_tag,        ->(tag_id) { where(tag_id: tag_id) }
end
