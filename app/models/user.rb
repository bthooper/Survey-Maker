class User < ActiveRecord::Base

  validates :username, presence: { message: "You must provide a username." }, uniqueness: { message: "Username is already taken." }
  validates :email, presence: { message: "You must provide an email." }, uniqueness: { message: "That email is alreday taken." } 
  validates :password, presence: { message: "Password cannot be blank." }
  
  has_secure_password validations: false

  has_many :surveys


end
