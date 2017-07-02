require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base

  def self.trip_chunks_by_date
    Trip.order(start_date: :desc).in_batches(of: 30)
  end

  def self.per_page
    30
  end
end
