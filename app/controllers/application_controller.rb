class ApplicationController < ActionController::Base

  analytical :use_session_store=>true
  protect_from_forgery

  def session_id
    @session_id ||= session[:session_id]
  end

  def gender_pref
    @gender_pref ||= session[:gender_pref]
  end
end
