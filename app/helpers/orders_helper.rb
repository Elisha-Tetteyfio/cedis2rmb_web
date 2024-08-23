module OrdersHelper
  def order_status_bg(status)
    case status
    when 'Pending'
      "bg-status_yellow"
    when 'Completed'
      "bg-status_green"
    when 'Cancelled'
      "bg-status_red"
    end
  end

  def order_status_color(status)
    case status
    when 'Pending'
      "text-status_yellow_dark"
    when 'Completed'
      "text-status_green_dark"
    when 'Cancelled'
      "text-status_red_dark"
    end
  end
end
