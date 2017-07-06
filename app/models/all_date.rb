class AllDate < ActiveRecord::Base
  has_many :start_dates
  has_many :end_dates
  validates :todays_date, presence: true
end
