class ProjectController < ApplicationController
  
  def index
    @projects = Project.includes(:todos)
    render json: @projects, include: { todos: { except: [:project_id] }}
  end

  def create
    if (!params[:project_id]) 
      @project = Project.create(title: params[:title])
    else
      @project = Project.find(params[:project_id])
    end
    @todo = Todo.new(todo_params)
    @todo.project_id = @project.id
    save_todo

  end

  def update
    @project = Project.find(params[:project_id])
    @todo = Todo.find(params[:todo_id])
    @todo.assign_attributes(todo_params)
    save_todo
  end

  private

  def save_project 
    if @todo.save
      redirect_to "/projects"
    else 
      redirect_to "/projects"
    end
  end

  def todo_params
    params.require(:todo).permit(:text, :isCompleted)
  end
end
