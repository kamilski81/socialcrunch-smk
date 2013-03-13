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
  index :"stat.shag_count" => -1
  index :"stat.marry_count" => -1
  index :"stat.kill_count" => -1

  embeds_one :stat
  after_initialize :build_stat_if_nil

  def build_stat_if_nil
    if stat.nil?
      self.stat = Stat.new
    end
  end

  def self.get_questions(session_id, gender_pref)
    # get existing responses of user
    exclude_qids  = get_users_responses(session_id)
    questions     = get_next_questions(exclude_qids, gender_pref)
    questions
  end

  def self.get_users_responses(session_id)
    responses = Response.where(session_id: session_id).only(:question_id).to_a
    question_ids = responses.map {|response|
      response.question_id.to_s
    }
    question_ids
  end

  def self.get_next_questions(exclude_qids, gender_pref)
    #criteria = Question.not_in(_id: exclude_qids).order_by(:sequence.asc).limit(1) #@kamtodo: 3)
    criteria = Question.not_in(_id: exclude_qids).order_by(:sequence.asc).limit(3)

    if gender_pref == Constants::MALE || gender_pref == Constants::FEMALE
      criteria = criteria.where(gender: gender_pref)
    end

    criteria
  end

  def self.increment_stats(question, response)
    question.stat.inc("#{response.downcase}_count", 1)
    question.stat.inc("total_count", 1)
  end
end