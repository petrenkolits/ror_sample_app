class BookAction
  include ActiveModel::Model

  attr_accessor :city_id, :date, :last_name, :first_name, :phone_number

  validates :city_id, :date, :last_name, :first_name, :phone_number, presence: true
  validate :check_cleaner_availability

  def save
    return self unless valid?
    Booking.create date: date, city_id: city_id, cleaner_id: cleaner.id, customer_id: customer.id
  end

  protected

  def check_cleaner_availability
    return if cleaner.present?
    errors.add :cleaner, 'not available for specified time slot'
  end

  def booked_ids
    @booked_ids ||= Booking.where(date: date).pluck(:cleaner_id)
  end

  def customer
    @customer ||= Customer.find_or_create_by(phone_number: phone_number) do |c|
      c.assign_attributes last_name: last_name, first_name: first_name
    end
  end

  def cleaner
    @cleaner ||= Cleaner.joins(:cities).where(cities_cleaners: {city_id: city_id})
      .where.not(id: booked_ids).first
  end
end
