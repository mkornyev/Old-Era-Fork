class Flagging < ApplicationRecord
  belongs_to :resource
  belongs_to :flag
end
