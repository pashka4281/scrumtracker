require 'rails_helper'

RSpec.describe Api::StoriesController, :type => :controller do
  render_views

  describe '#index' do
    it 'should redirect guests' do
      project = create :project
      create_list(:story, 2, project: project) 

      get :index, project_id: project.id, format: 'json'
      expect(response).to redirect_to :new_sessions
    end

    context 'authenticated' do
      before do
        sign_in create(:user)
      end

      it 'should load all stories for a project' do
        project = create :project
        create_list(:story, 2, project: project) 

        get :index, project_id: project.id, format: 'json'
        expect(assigns[:stories].count).to eq(2)
      end

      it 'should raise exception if project_id is missing' do
        expect{ get :index, format: 'json' }.to raise_error(ActionController::ParameterMissing)
      end      
    end

  end
  
  describe '#show' do
    it 'should redirect guests' do
      story = create(:story) 
      get :show, id: story.id, project_id: story.project_id, format: 'json'
      expect(response).to redirect_to :new_sessions
    end

    context 'authenticated' do
      before do
        sign_in create(:user)
      end

      it 'should load story by id' do
        story = create(:story) 
        get :show, id: story.id, project_id: story.project_id, format: 'json'
        expect(JSON.parse(response.body).keys).to_not be_empty
      end

      it 'should raise exception if project_id is missing' do
        story = create :story
        expect{ get :show, id: story.id, format: 'json' }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe 'PUT #update' do
    let(:project){ create :project }
    let(:story){ create :story, project: project }

    before do
      @update_params = { title: "new title", description: "Some text for description", points: 3 }
    end

    it 'should not update if not logged in' do
      xhr :put, :update, story: @update_params, id: story.id, project_id: project.id, format: 'json'
      expect(response.status).to eq(401)
    end

    context 'authenticated' do
      before do
        sign_in create(:user)
      end

      it 'should update story' do
        expect{ xhr :put, :update, story: @update_params, id: story.id, project_id: project.id, format: 'json' }.to change { story.reload.title }
      end
    end

  end

  describe 'POST #create' do
    let(:project){ create :project }

    before do
      @update_params = { title: "new title", description: "Some text for description", points: 3 }
    end

    it 'should not create if not logged in' do
      xhr :post, :create, story: @update_params, project_id: project.id, format: 'json'
      expect(response.status).to eq(401)
    end

    context 'authenticated' do
      before do
        sign_in create(:user)
      end

      it 'should create story' do
        expect{ xhr :post, :create, story: @update_params, project_id: project.id, format: 'json' }.to change { Story.count }
      end
    end

  end
end
