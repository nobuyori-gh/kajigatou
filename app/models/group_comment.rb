class GroupComment < ApplicationRecord
  belongs_to :user
  belongs_to :group_task

  validates :comment, presence: true
end
