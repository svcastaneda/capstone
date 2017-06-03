class DegreeReq < ActiveRecord::Base
  belongs_to :degree
  has_one :course
end