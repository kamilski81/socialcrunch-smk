class Response
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  belongs_to :question

  field :session_id, type: String
  field :response, type: String # Bang, marry or kill
  field :gender_pref, type: String

  index session_id: 1


  def self.respond(session_id, question_id, response, gender_pref)
    question = Question.find(question_id)
    Response.create!(question:question, session_id: session_id,
                     response: response, gender_pref: gender_pref)
    Question.increment_stats(question, response)
  end
end