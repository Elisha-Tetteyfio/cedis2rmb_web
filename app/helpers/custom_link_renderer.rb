class CustomLinkRenderer < WillPaginate::ActionView::LinkRenderer
  def initialize(options = {})
    options[:inner_window] ||= 2
    options[:outer_window] ||= 0
    super()
  end

  def html_container(html)
    tag(:div, html, container_attributes)
  end

  def windowed_page_numbers
    inner_window = @options[:inner_window] || 2
    outer_window = @options[:outer_window] || 0

    # Ensure the range stays within valid page numbers
    window_from = [current_page - inner_window, 1].max
    window_to = [current_page + inner_window, total_pages].min

    visible_pages = []

    # Add first pages with outer_window
    visible_pages += (1..outer_window).to_a if outer_window > 0

    # Add left ellipsis if needed
    if window_from > outer_window + 1
      visible_pages << :gap
    end

    # Add the middle range of pages
    visible_pages += (window_from..window_to).to_a

    # Add right ellipsis if needed
    if window_to < total_pages - outer_window
      visible_pages << :gap
    end

    # Add last pages with outer_window
    visible_pages += ((total_pages - outer_window + 1)..total_pages).to_a if outer_window > 0

    visible_pages
  end

  def page_number(page)
    if page == :gap
      tag(:span, '...', class: "pagination-ellipses")
    elsif page == current_page
      tag(:span, page, class: "current")
    else
      link(page, page, class: "page-link")
    end
  end
end
