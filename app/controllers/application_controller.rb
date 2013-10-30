class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery

  before_filter :authorize

  def must_be_logged_in
    if signed_in?
      current_user.email
      link_to 'Sign out', sign_out_path, method: :delete
    else
      link_to 'Sign in', sign_in_path
    end
  end
end
