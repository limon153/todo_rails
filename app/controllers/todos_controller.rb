class TodosController < ApplicationController
  def index
    @projects = Project.all
    @todo = Todo.new()
  end

  def update

  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    
    redirect_to root_path
  end

  private
    def todo_params
      params.require(:todo).permit(:text, :isCompleted, :project_id)
    end
end
