require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "has email" do
    if "required" then
      user = User.new(name: 'Test user')
      expect(user.save).to be_falsey
    end
  end

  #describe "has gender"
  #  user = User.new(name: 'Test user', gender: :male)
  #  expect(user.save).to be_falsey
  #end
end
