module Publisher::BaseHelper
  def full_title_for_publisher page_title = ""
    base_title = "Publisher Manager"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
