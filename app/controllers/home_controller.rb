class HomeController < ApplicationController
  def index
  end

  def leader_board
    @most_shagged = Question.ordered_by("shag_count")
    @most_married = Question.ordered_by("marry_count")
    @most_killed  = Question.ordered_by("kill_count")
  end

  def the_end
    @questions = Question.all.limit(6)
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