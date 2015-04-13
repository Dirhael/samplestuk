require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  context 'GET  methods' do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
    end

    describe 'get index' do
      it 'should return all the tasks with the state "to_do"' do
        task = FactoryGirl.create(:task, user: @user)
        get :index
        expect(assigns(:to_do)).to eq [task]
      end

      it 'should return all the tasks with the state "doing"' do
        task = FactoryGirl.create(:task, user: @user, state: 'doing')
        get :index
        expect(assigns(:doing)).to eq [task]
      end

      it 'should return all the tasks with the state "done"' do
        task = FactoryGirl.create(:task, user: @user, state: 'done')
        get :index
        expect(assigns(:done)).to eq [task]
      end

      it 'should render the index view' do
        get :index
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
      end
    end

    describe 'get new' do
      it 'should render the new view' do
        get :new
        expect(response).to render_template(:new)
        expect(response.status).to eq(200)
      end
    end

    describe 'post create' do
      context 'with valid attributes' do
        before do
          @a_task = FactoryGirl.attributes_for(:task)
        end
        it 'should create a new task' do
          expect { post :create, task: @a_task }.to change(Task, :count).by(1)
        end

        it 'should redirect to the created task' do
          post :create, task: @a_task
          expect(response).to redirect_to Task.last
        end
      end

      context 'with invalid attributes' do
        before do
          @a_task = FactoryGirl.attributes_for(:invalid_task)
        end

        it 'should not create a new task' do
          expect { post :create, task: @a_task }.to change(Task, :count).by(0)
        end

        it 'should render the new view again' do
          post :create, task: @a_task
          expect(response).to render_template(:new)
        end
      end
    end
  end

end