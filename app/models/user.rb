class User < ActiveRecord::Base
  has_secure_password
  
  has_one :student, foreign_key: "id"

  validates :fname, presence: true
  validates :lname, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, allow_nil: true, length: {minimum: 8, maximum: 25}
  
  def admin?
    account_type == 'Admin'
  end
  
  def faculty?
    account_type == 'Faculty'
  end
  
  def student?
    account_type == 'Student'
  end
end
