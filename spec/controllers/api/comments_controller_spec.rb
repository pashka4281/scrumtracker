require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  describe 'POST # create' do
 
    it 'should require login' do
      project = create(:project)
      story = create(:story, project: project)
      xhr :post, :create, project_id: project.id, story_id: story.id, comment: { body: "Some text"}
      expect(response.status).to eq(401)
    end
  end
end
