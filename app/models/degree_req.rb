class DegreeReq < ActiveRecord::Base
  belongs_to :degree
  belongs_to :course, class_name: "Course", foreign_key: :num, primary_key: :num
end