class HomeController < ApplicationController
  def index
  end

  def leader_board
    @most_shagged_male = Question.leaders("male", "bang_count")
    @most_married_male = Question.leaders("male", "marry_count")
    @most_killed_male  = Question.leaders("male", "kill_count")

    @most_shagged_female = Question.leaders("female", "bang_count")
    @most_married_female = Question.leaders("female", "marry_count")
    @most_killed_female  = Question.leaders("female", "kill_count")
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