module Publisher::BaseHelper
  def full_title_for_publisher page_title = ""
    base_title = "Publisher Manager"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def get_status status
    badges = case status.to_sym
      when :Using
        "danger"
      when :Openning
        "success"
      when :Pending
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
end
