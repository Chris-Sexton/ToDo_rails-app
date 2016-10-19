class TodoItem < ActiveRecord::Base
  belongs_to :user
  has_one :todo_list

  def completed?
    !completed_at.blank?
  end
end
