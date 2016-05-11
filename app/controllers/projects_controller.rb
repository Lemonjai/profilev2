class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :udpate, :destroy]

  def index
    @projects = Project.all.order("created_at DESC")
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, notice: "Nice Leo! That project was successfully saved!"
    else
      render 'new'
    end

  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :link)
    end
end
