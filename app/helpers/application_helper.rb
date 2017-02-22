module ApplicationHelper

  # Returns the appropriete page title.
  def full_title(page_title)
    @base_title = "Rails Social Network"
    if !page_title.blank?
      "#{page_title} | #{@base_title}"
    else
      "#{@base_title}"
    end
  end

end
