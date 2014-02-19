class ZendeskSessionsController < ApplicationController
  include ApplicationHelper

  def new
    redirect_to zendesk_help_url
  end
end
