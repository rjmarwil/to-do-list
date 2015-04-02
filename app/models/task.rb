class Task < ActiveRecord::Base
  validates :description, presence: true

  def self.swap(task, direction)
    return if task.placement == 0 || task.placement == Task.count - 1

    current_place = task.placement
    other_task = Task.find_by(placement: current_place + direction)
    other_place = other_task.placement

    other_task.update(placement: current_place)
    task.update(placement: other_place)
  end
end
