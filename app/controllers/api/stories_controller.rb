class Api::StoriesController < Api::BaseController
  def index
    @stories = current_project.stories
  end

  private

  def current_project
    @project ||= Project.find(params[:project_id])
  end
end
