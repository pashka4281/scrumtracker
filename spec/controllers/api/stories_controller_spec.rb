require 'rails_helper'

RSpec.describe Api::StoriesController, :type => :controller do
  render_views

  describe '#index' do
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
  
  describe '#show' do
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

  describe 'PUT #update' do
    it 'should not update if not logged in' do
      pending
    end
  end
end
