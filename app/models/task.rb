class Task < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true

  def complete!
    update(completed: true)
  end

end
