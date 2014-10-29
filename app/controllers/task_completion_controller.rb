class TaskCompletionController < ApplicationController
  def create
    task = Task.find(params[:id])
    task.complete!
    redirect_to root_path
  end

end
