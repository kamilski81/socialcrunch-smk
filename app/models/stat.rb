class Stat
  include Mongoid::Document

  field :shag_count,  type: Integer, default: 0
  field :marry_count, type: Integer, default: 0
  field :kill_count,  type: Integer, default: 0
  field :total_count, type: Integer, default: 0

  embedded_in :question
end