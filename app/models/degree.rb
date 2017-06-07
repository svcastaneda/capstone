class Degree < ActiveRecord::Base
  has_many :degree_reqs
  has_many :courses, through: :degree_reqs, foreign_key: :num, primary_key: :num
end
