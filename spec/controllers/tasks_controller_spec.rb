require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  context 'GET  methods' do
    let!(:user) { FactoryGirl.create(:user) }
    before {sign_in(:user)}

    describe 'get index' do
      it 'should return all the tasks' do
        task = FactoryGirl.create(:task)
        get :index
        assigns(:tasks).should eq([task])
      end

      it 'should render the index view' do

      end
    end
  end

end