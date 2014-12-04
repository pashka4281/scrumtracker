class Api::ProjectsController < Api::BaseController
  def index
    @projects = Project.all
  end
end
