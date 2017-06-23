module CleanersHelper
  def cleaner_cities(cleaner)
    cleaner.cities.pluck(:name).join(', ')
  end
end
