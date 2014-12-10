class Api::StoriesController < Api::BaseController
  def index
    @stories = current_project.stories
  end

  def show
    @story = current_project.stories.find params[:id]
  end

  private

  def current_project
    @project ||= Project.find(params.fetch(:project_id))
  end
end
