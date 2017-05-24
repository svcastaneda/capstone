class Student < ActiveRecord::Base
  belongs_to :user, foreign_key: "id"
  has_one :degree
end
