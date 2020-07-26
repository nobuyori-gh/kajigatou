class GroupTask < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :title, presence: true
  validates :body, presence: true
end