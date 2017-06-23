class Booking < ActiveRecord::Base
  belongs_to :city
  belongs_to :customer
  belongs_to :cleaner

  validates :date, :city, :cleaner, :customer, presence: true
end
