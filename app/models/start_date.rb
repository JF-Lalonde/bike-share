class StartDate < ActiveRecord::Base
  validates :date_id, presence: true
end
