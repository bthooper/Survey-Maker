class User < ActiveRecord::Base

  validates :username, :email, presence: { message: "You must provide a username and email." }
  validates :username, :email, uniqueness: { message: "That username and/or email is alreday taken." } 
  
  has_secure_password

  has_many :surveys


end
