class Response
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  belongs_to :question

  index :session_id

  field :session_id, type: String
  field :response, type: String # Shag, marry or kill
end