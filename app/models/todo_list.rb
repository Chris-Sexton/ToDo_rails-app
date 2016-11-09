class TodoList < ActiveRecord::Base
  has_many :todo_items
  has_many :users, through: :assignments

  validates :title, presence: true
  validates :description, presence: true
  validates :title, uniqueness: true
end
