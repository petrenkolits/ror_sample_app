class City < ActiveRecord::Base
  has_many :bookings
  has_many :cleaners

  validates :name, presence: true
end
