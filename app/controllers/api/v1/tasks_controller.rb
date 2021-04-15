class Api::V1::TasksController < ApiController

  def index
    tasks = Task.all 
    render json: tasks
  end

  def create 
    new_task = Task.new(task_params)

    if new_task.save
      render json: { task: new_task }
    else  
      render json: { errors: new_task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
