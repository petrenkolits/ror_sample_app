class Cleaner < ActiveRecord::Base
  has_and_belongs_to_many :cities
  validates :last_name, :first_name, presence: true
  validates_inclusion_of :quality_score, in: 0.0..5.0
end
