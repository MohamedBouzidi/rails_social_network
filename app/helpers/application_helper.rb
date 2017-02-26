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

  def login_remembered_user
    if !cookies.signed[:remember_digest].nil?
      user = User.find(:remember_digest => cookies.signed[:remember_digest])
      log_in user
    end
  end

end
