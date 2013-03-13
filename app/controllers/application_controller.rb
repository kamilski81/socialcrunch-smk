class ApplicationController < ActionController::Base
  protect_from_forgery

  def session_id
    @session_id ||= session[:session_id]
  end

  def gender_pref
    @gender_pref ||= session[:gender_pref]
  end
end
