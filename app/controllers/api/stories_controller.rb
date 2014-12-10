class Api::StoriesController < Api::BaseController
  def index
    @stories = current_project.stories
  end

  def show
    @story = current_project.stories.find params[:id]
  end

  def update
    @story = current_project.stories.find params[:id]
    if @story.update_attributes story_params
      render :show
      # render nothing: true, status: 200
    else
      render nothing: true, status: 403 # forbidden
    end
  end

  private

  def current_project
    @project ||= Project.find(params.fetch(:project_id))
  end

  def story_params
    params.require(:story).permit(:title, :description, :points, :type)
  end
end
