class HomeController < ApplicationController
  def index
  end

  def leader_board
  end

  def the_end
  end

  def update_gender_pref
    session[:gender_pref] = params[:gender_pref].downcase if params[:gender_pref]
    redirect_to questions_path
  end

  def signout
    reset_session
    redirect_to home_path
  end
end