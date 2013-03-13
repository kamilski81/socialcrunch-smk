class Stat
  include Mongoid::Document

  field :shags, type: Integer, default: 0
  field :marries, type: Integer, default: 0
  field :kills, type: Integer, default: 0
  field :total, type: Integer, default: 0

  embedded_in :question
end