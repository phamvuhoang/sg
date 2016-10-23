class User < ApplicationRecord

  has_secure_password
  #attr_accessor :password

  validates :name, presence: true#:presence => { :message => "Name can't be blank" }
  #validates :password, :presence => { :message => "Password cannot be blank" }
  validates :email, presence: true, uniqueness: {case_insensitive: false}#:presence => { :message => "Email can't be blank" }, uniqueness: {case_insensitive: false}

  def received_messages
    Message.where(recipient: self).order("created_at DESC")
  end

  def sent_messages
    Message.where(user: self).order("created_at DESC")
  end

  def last_received_messages(n)
    received_messages.order(created_at: :desc).limit(n).order("created_at DESC")
  end

  def unread_messages
    received_messages.unread
  end

  #has_many :recipient_messages, class_name: 'Message', foreign_key: 'recipient_id'
  #has_many :sender_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :messages
  has_many :recipients, :through => :messages

end
