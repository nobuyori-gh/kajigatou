class CreateGroupTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :group_tasks do |t|
      t.references :group, foreign_key: true
      t.references :user,  foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.string :rep
      t.datetime :deadline, null: false
      t.boolean :status, default: false, null: false
      t.timestamps
    end
  end
end
