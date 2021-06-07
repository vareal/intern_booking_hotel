module Publisher::BaseHelper
  def full_title_for_publisher page_title = ""
    base_title = "Publisher Manager"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def get_status status
    sts = case status
      when 1
        "Openning"
      when 2
        "Pendding"
      when 3
        "Ussing"
      end
    badges = case sts.to_sym
      when :Ussing
        "danger"
      when :Openning
        "success"
      when :Pendding
        "warning"
      end
    tag.span class: "badge rounded-pill bg-#{badges}" do
      t(".#{sts}")
    end
  end
  
  def badges_status

  end
end
