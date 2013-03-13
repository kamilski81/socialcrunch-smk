class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :responses

  field :name,  type: String
  field :description, type: String
  field :image, type: String
  field :gender,type: String
  #field :category, type: String # (ie. movie celebrity, politician)
  field :sequence_num, type: Integer, default: 0 # This is used to get the images in sequence

  #field :twitter, type: String #Phil to do in future cause it will be time consuming
  #field :facebook, type: String

  index gender: 1, sequence_num: 1
  index :"stat.shags" => -1
  index :"stat.marries" => -1
  index :"stat.kills" => -1

  embeds_one :stat

  def self.get_next_questions(session_id, gender_pref)
    # get existing responses of user
    qids = get_all_question_ids_of_user(session_id)

    questions = get_next_questions(qids, gender_pref)
  end

  def self.get_all_question_ids_of_user(session_id)
    responses = Response.where(session_id: session_id).only(:question_id)
    question_ids = responses.map(&:question_id)
  end

  def self.get_next_questions(qids, gender_pref)
    criteria = Question.where(question_id: qids).order_by(:sequence.asc).limit(3)

    if gender_pref == Constants::MALE || gender_pref == Constants::FEMALE
      criteria = criteria.where(gender: gender_pref)
    end

    criteria
  end
end