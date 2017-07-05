class City < ActiveRecord::Base
  # has_many :stations
  validates :name, presence: true
  validates :name, uniqueness: true
end
