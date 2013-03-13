class QuestionsController < ApplicationController
  def index
    #create_questions
    create_responses
    Question.get_all_question_ids_of_user(session_id)
  end

  def respond

  end

  private

  def create_questions
    Question.create!( name: "Pamela Anderson", description: "Former Playboy model",
                      image: "url.com", gender: Constants::FEMALE, sequence_num: 1)
    Question.create!( name: "Jen Gardner", description: "actress",
                      image: "url2.com", gender: Constants::FEMALE, sequence_num: 1)
    Question.create!( name: "Anna Kournikova", description: "tennis player",
                      image: "url3.com", gender: Constants::FEMALE, sequence_num: 1)

    Question.create!( name: "Bobanna", description: "Former Playboy model",
                      image: "url.com", gender: Constants::FEMALE, sequence_num: 1)
    Question.create!( name: "Nina", description: "actress",
                      image: "url2.com", gender: Constants::FEMALE, sequence_num: 1)
    Question.create!( name: "Slaya", description: "tennis player",
                      image: "url3.com", gender: Constants::FEMALE, sequence_num: 1)

  end

  def create_responses
    Response.create!(question:Question.last, session_id: session_id, response: Constants::SHAG)
  end
end