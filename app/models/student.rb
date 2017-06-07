class Student < ActiveRecord::Base
  belongs_to :user, foreign_key: "id"
  belongs_to :degree
  has_many :degree_reqs, through: :degree
  has_many :taken_courses
  has_many :courses, through: :taken_courses
end
