require 'rails_helper'

RSpec.describe Task, type: :model do
  it {should have_attributes(:content, :state)}


  it 'has a valid factory' do
    FactoryGirl.build(:task).should be_valid
  end

  it 'is invalid without a content' do
    FactoryGirl.build(:task, content: nil).should_not be_valid
  end

end
