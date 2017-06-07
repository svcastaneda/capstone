class Param < ActiveRecord::Base
  belongs_to :degree
  has_many :reports, foreign_key: :params_id
end