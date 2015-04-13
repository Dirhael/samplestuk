require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User attributes' do
    before do
      @user = FactoryGirl.build(:user)
    end
    it 'should have a password of at least 8 characters length' do
      expect(@user.password.length).to be_between(7,16)
    end

    it 'should have an email' do
      expect(@user.email).to match(/[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/)
    end
  end
end