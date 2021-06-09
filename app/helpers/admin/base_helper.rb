module Admin::BaseHelper
  def full_title_for_admin page_title = ""
    base_title = "Admin Manager"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def active_for_sidebar className = ""
    base_cn= "nav-link"
    className.empty? ? base_cn : className + " " + base_cn
  end
end
