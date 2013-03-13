class Response
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  belongs_to :question

  index session_id: 1

  field :session_id, type: String
  field :response, type: String # Shag, marry or kill
  field :gender_pref, type: String

end