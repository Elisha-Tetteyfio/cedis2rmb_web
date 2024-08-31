module OrdersHelper
  def order_status_bg(status)
    case status
    when 'Pending'
      "bg-yellow-light"
    when 'Completed'
      "bg-green-light"
    when 'Cancelled'
      "bg-red-light"
    end
  end

  def order_status_bg_dark(status)
    case status
    when 'Pending'
      "bg-yellow"
    when 'Completed'
      "bg-green"
    when 'Cancelled'
      "bg-red"
    end
  end

  def order_status_color(status)
    case status
    when 'Pending'
      "text-yellow"
    when 'Completed'
      "text-green"
    when 'Cancelled'
      "text-red"
    end
  end
end
