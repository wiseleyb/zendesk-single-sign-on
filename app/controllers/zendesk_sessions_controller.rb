class ZendeskSessionsController < ApplicationController
  def new
    if current_user
      # If the submitted credentials pass, then log user into Zendesk
      redirect_to Zendesk.sign_into_zendesk(current_user)
    else
      flash[:notice] = 'Join Causes to contact support'
      redirect_to home_path
    end
  end
end
