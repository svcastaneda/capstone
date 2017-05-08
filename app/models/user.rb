class User < ActiveRecord::Base
  has_secure_password
  
  belongs_to :account, polymorphic: true

  validates :fname, presence: true
  validates :lname, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, allow_nil: true, length: {minimum: 8, maximum: 25}
end
