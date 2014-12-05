require 'rails_helper'

RSpec.describe Api::ProjectsController, :type => :controller do
  describe '#index' do
    it 'should load all projects' do
      create_list(:project, 2) 

      get :index, format: 'json'
      expect(assigns[:projects].count).to eq(2)
    end
  end
  
  describe '#show' do
    it 'should load project by id' do
      project = create(:project) 

      get :show, id: project.id, format: 'json'
      expect(assigns[:project]).to eq(project)
    end
  end
end
