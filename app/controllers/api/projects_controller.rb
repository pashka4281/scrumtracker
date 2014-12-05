class Api::ProjectsController < Api::BaseController
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
end
