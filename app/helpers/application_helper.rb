module ApplicationHelper
  def current_namespace?(namespace)
    request.fullpath.start_with?("/#{namespace}")
  end

  def format_date(date)
    date.strftime("%d-%m-%Y, %H:%M")
  end
end
