class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, presence: true
  validates :city, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :name, uniqueness: true
end
