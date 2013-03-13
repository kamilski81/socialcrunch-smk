class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :responses

  field :name,  type: String
  field :description, type: String
  field :image, type: String
  field :gender,type: String
  field :category, type: String # (ie. movie celebrity, politician)
  field :sequence_num, type: Integer, default: 0 # This is used to get the images in sequence

  #field :twitter, type: String #Phil to do in future cause it will be time consuming
  #field :facebook, type: String

  index gender: 1, sequence_num: 1
  index "stat.shags"
  index "stat.marries"
  index "stat.kills"

  embeds_one :stat

end