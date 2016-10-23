class Message < ApplicationRecord

  belongs_to :user
  belongs_to :recipient, class_name: 'User'

  def read?
    read_at
  end

  def mark_as_read!
    self.read_at = Time.now
    save!
  end

end
