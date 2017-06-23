module ApplicationHelper
  def display_name(customer_or_cleaner)
    [customer_or_cleaner.first_name, customer_or_cleaner.last_name].join ' '
  end
end
