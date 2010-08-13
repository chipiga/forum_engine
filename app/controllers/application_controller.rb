class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'forum'

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
      format.xml { render :xml => exception.message, :status => :forbidden }
    end
  end
end
