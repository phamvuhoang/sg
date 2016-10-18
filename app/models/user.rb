class User < ApplicationRecord

  has_secure_password
  #attr_accessor :password

  validates :name, presence: true#:presence => { :message => "Name can't be blank" }
  #validates :password, :presence => { :message => "Password cannot be blank" }
  validates :email, presence: true, uniqueness: {case_insensitive: false}#:presence => { :message => "Email can't be blank" }, uniqueness: {case_insensitive: false}
end
