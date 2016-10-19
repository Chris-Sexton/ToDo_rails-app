class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  def completed?
    !completed_at.blank?
  end
end
