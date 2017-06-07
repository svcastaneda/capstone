class Report < ActiveRecord::Base
  belongs_to :student
  belongs_to :param
  belongs_to :course
end
