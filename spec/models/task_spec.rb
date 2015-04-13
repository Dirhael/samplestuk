require 'rails_helper'

RSpec.describe Task, type: :model do

  context 'valid factory' do
    before do
      @task = FactoryGirl.build(:task)
    end
    it 'has a valid content' do
      expect(@task).to be_valid
    end

    it 'belongs to a user' do
      expect(@task.user).to be_a(User)
    end

    it 'should have a state' do
      expect(@task.state).to_not eq nil
    end
  end

  context 'invalid factory' do
    before do
      @invalid_task = FactoryGirl.build(:invalid_task)
    end
    it 'is invalid without a content' do
      expect(@invalid_task).to_not be_valid
    end

    it 'should be invalid without a user' do
      expect(@invalid_task.user).to be nil
    end

    it 'should be invalid without a state' do
      expect(@invalid_task.state).to be nil
    end
  end

  context 'state changes' do
    before do
      @task = FactoryGirl.build(:task)
    end

    it 'should have an initial state of "to_do"' do
      expect(@task.state).to eq 'to_do'
    end

    it 'should have a state of "doing"' do
      @task.state = 'doing'
      expect(@task.state).to eq 'doing'
    end

    it 'should have a state of "done"' do
      @task.state = 'done'
      expect(@task.state).to eq 'done'
    end
  end

end
