class CreateGroupComments < ActiveRecord::Migration[5.2]
  def change
    create_table :group_comments do |t|
      t.references :group_task, foreign_key: true
      t.references :user,  foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
