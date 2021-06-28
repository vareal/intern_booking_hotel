module Publisher::BaseHelper
  def full_title_for_publisher page_title = ""
    base_title = "Publisher Manager"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def pub_username
    @sheets = current_user.name.nil? ?
      "#{current_user.last_name} #{current_user.first_name}":
      current_user.name
  end

  def get_status status
    badges = case status.to_sym
      when :using
        "danger"
      when :openning
        "success"
      when :pending
        "warning"
      end
    tag.span class: "badge rounded-pill bg-#{badges}" do
      t(".#{status}")
    end
  end

  def get_bill_status status
    badges = case status.to_sym
      when :cancel
        "danger"
      when :returned
        "warning"
      when :approved
        "success"
      end
    tag.span class: "badge bg-#{badges}" do
      t(".#{status}")
    end
  end

  def active_for_sidebar className = ""
    base_cn= "nav-link"
    className.empty? ? base_cn : className + " " + base_cn
  end

  def time_when_create_order create_order_time
    seconds = Time.current - create_order_time
    total_minutes = (seconds / 1.minutes).to_f.round
    if total_minutes < 60
      "#{total_minutes.round} minutes ago"
    elsif (60..1399) === total_minutes
      total_hours = total_minutes / 60
      "#{total_hours.round} hours ago"
    elsif total_minutes >= 1440
      total_days = total_minutes / 1440
      "#{total_days.round} days ago"
    end
  end
end
