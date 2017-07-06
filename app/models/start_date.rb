class StartDate < ActiveRecord::Base
  belongs_to :start_date
  has_many :trips
  validates :date_id, presence: true

  def all_date
    AllDate.find(self.date_id)
  end
end
