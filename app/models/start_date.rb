class StartDate < ActiveRecord::Base
  belongs_to :all_date
  has_many :trips
  validates :date_id, presence: true
end
