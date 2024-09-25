module ApplicationHelper
  def current_namespace?(namespace)
    request.fullpath.start_with?("/#{namespace}")
  end

  def format_date(date)
    date.strftime("%d-%m-%Y, %H:%M")
  end

  def format_amount(amount)
    sprintf('%.2f', amount)
  end

  def convert_to_cedis(amount, rate)
    amount/rate
  end

  def convert_to_rmb(amount, rate)
    amount*rate
  end
end
