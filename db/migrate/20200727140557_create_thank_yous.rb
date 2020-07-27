class CreateThankYous < ActiveRecord::Migration[5.2]
  def change
    create_table :thank_yous do |t|
      t.integer :user_id
      t.integer :group_task_id

      t.timestamps
    end
  end
end
