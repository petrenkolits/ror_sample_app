class Customer < ActiveRecord::Base
  validates :last_name, :first_name, presence: true
end
