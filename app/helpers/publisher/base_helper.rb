module Publisher::BaseHelper
  def full_title_for_publisher page_title = ""
    base_title = "Publisher Manager"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def get_status status
    badges = case status.to_sym
      when :Ussing
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
end
