class TodosController < ApplicationController
  def index
    @projects = Project.all
    @todo = Todo.new()
    @todos = Todo.all
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.isCompleted
      @todo.isCompleted = false
    else
      @todo.isCompleted = true
    end
    @todo.save

    head :ok
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
