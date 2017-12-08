class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @projects = Project.all
    @todo = Todo.new()
    @todos = Todo.all

    respond_to do |format|
      format.html
      format.json { render json: @todos }
    end
  end

  def update
    @todo = Todo.find(params[:id])

    @todo.isCompleted = !@todo.isCompleted;
    @todo.save

    head :ok
  end

  def create
    @todo = Todo.new(todo_params)
    
    @todo.save
    
    redirect_to root_path
  end

  def create_from_app
    data_json = JSON.parse request.body.read
 
    @todo = Todo.new(data_json)
    @todo.save
 end

  def update_from_app
    data_json = JSON.parse request.body.read
    @todo = Todo.find(data_json.id)

    @todo.isCompleted = data_json.isCompleted
    @todo.save
  end

  private
    def todo_params
      params.require(:todo).permit(:text, :isCompleted, :project_id)
    end
end
