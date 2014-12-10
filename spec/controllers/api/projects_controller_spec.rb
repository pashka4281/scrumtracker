require 'rails_helper'

RSpec.describe Api::ProjectsController, :type => :controller do
  describe '#index' do
    it 'should restrict access if not signed in' do
      get :index, format: 'json'
      expect(response).to redirect_to :new_sessions
    end

    context 'authenticated' do
      it 'should load all projects for signed in user' do
        sign_in create(:user)
        create_list(:project, 2)

        get :index, format: 'json'
        expect(assigns[:projects].count).to eq(2)
      end
    end
  end
  
  describe '#show' do
    it 'should restrict access if not signed in' do
      project = create(:project)
      get :show, id: project.id, format: 'json'
      expect(response).to redirect_to :new_sessions
    end

    context 'authenticated' do
      it 'should load project by id for signed_in user' do
        sign_in create(:user)
        project = create(:project)

        get :show, id: project.id, format: 'json'
        expect(assigns[:project]).to eq(project)
      end
    end
  end
end
