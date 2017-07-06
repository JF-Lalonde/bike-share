class AllDate < ActiveRecord::Base
  validates :todays_date, presence: true
end
