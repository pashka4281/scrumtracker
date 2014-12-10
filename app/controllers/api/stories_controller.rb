class Api::StoriesController < Api::BaseController
  def index
    @stories = current_project.stories
  end

  def show
    @story = current_project.stories.find params[:id]
  end

  def update
    @story = current_project.stories.find params[:id]
    if @story.update_attributes update_params
      render :show
      # render nothing: true, status: 200
    else
      render nothing: true, status: 403 # forbidden
    end
  end
  
  def create
    @story = current_project.stories.new(create_params)
    if @story.save
      render :show
    else
      render nothing: true, status: 403 # forbidden
    end
  end

  def destroy
    @story = current_project.stories.find params[:id]  
    @story.destroy
    render nothing: true, status: 200
  end
 
  private

  def current_project
    @project ||= Project.find(params.fetch(:project_id))
  end

  def update_params
    params.require(:story).permit(:title, :description, :points, :type, :board)
  end
  
  def create_params
    params.require(:story).permit(:title, :description, :points, :type, :board)
  end
end
