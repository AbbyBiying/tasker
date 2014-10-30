class TaskCompletionsController < ApplicationController
  def create
    task = Task.find(params[:id])
    task.completed = true
    task.save
    
    redirect_to root_path
  end

end
