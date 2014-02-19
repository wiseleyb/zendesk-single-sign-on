module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Zendesk Single Sign On"
    end
  end

  def zendesk_help_url(user = current_user)
    if current_user
      Zendesk.sign_into_zendesk(user)
    else
      'https://causesstaging.zendesk.com/hc/en-us/requests/new'
    end
  end
end
