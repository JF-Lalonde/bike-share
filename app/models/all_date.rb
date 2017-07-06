class AllDate < ActiveRecord::Base
  has_many :start_dates
  has_many :end_dates
  has_many :conditions
  validates :todays_date, presence: true
end
