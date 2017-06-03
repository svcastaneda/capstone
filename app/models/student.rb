class Student < ActiveRecord::Base
  belongs_to :user, foreign_key: "id"
  has_one :degree
  has_many :taken_courses
end
