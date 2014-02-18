module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ZendeskSingleSignOn"      
    end
  end
end
