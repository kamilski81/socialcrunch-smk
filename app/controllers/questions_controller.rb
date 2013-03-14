class QuestionsController < ApplicationController
  def index
    #create_questions
    @questions = more_questions
  end

  def show
    @questions = [Question.find(params[:id])]
    render "index"
  end

  def respond
    Rails.logger.info "Questions#respond. session_id: '#{session_id}', gender_pref: '#{gender_pref}'"
    params.each_entry do |key, val|
      if val.present? && Constants::SMK_OPTIONS.include?(val)
        question_id = key
        response = val
        Response.respond(session_id, question_id, response, gender_pref)
        Rails.logger.info "Responded to question_id: '#{question_id}', with response: '#{response}'"
      end
    end
    render :text => "success"
  end

  def get_more_questions
    @questions = more_questions
    render partial: "questions/questions_container", layout: nil
  end

  private

  def more_questions
    Question.get_questions(session_id, gender_pref)
  end

  def create_questions
    Question.create!( name: "Pamela Anderson", description: "Former Playboy model",
                      image: "url.com", gender: Constants::FEMALE, sequence_num: 1)
    Question.create!( name: "Jen Gardner", description: "actress",
                      image: "url2.com", gender: Constants::FEMALE, sequence_num: 1)
    Question.create!( name: "Anna Kournikova", description: "tennis player",
                      image: "url3.com", gender: Constants::FEMALE, sequence_num: 1)

    #Question.create!( name: "Bobanna", description: "Former Playboy model",
    #                  image: "url.com", gender: Constants::FEMALE, sequence_num: 1)
    #Question.create!( name: "Nina", description: "actress",
    #                  image: "url2.com", gender: Constants::FEMALE, sequence_num: 1)
    #Question.create!( name: "Slaya", description: "tennis player",
    #                  image: "url3.com", gender: Constants::FEMALE, sequence_num: 1)

  end
end