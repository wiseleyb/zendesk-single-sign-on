class ZendeskSessionsController < ApplicationController
  include ApplicationHelper

  # Zendesk will hit this url when someone tries to sign in on the
  # Zendesk side of things. If the user is already logged in on this
  # app it will create a token and redirect to Zendesk and the user will
  # be auto logged in. If the user isn't logged in on this app it will just
  # redirect to the new request page.
  def new
    redirect_to zendesk_help_url
  end
end
