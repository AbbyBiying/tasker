class Task < ActiveRecord::Base
  belongs_to :user

  def complete!
    self.completed = true
    update(completed: true)
  end

end
