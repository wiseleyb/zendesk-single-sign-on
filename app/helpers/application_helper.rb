module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ZendeskSingleSignOn"
    end
  end

  def zendesk_help_url
    if current_user
      Zendesk.sign_into_zendesk(current_user)
    else
      'https://causesstaging.zendesk.com/hc/en-us/requests/new'
    end
  end
end
