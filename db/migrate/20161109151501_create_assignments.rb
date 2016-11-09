class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :todo_list, index: true
      t.boolean :request_accepted, default: false, null: false
      t.timestamps null: false
    end
  end
end
