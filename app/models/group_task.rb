class GroupTask < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :group_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :rep, presence: true
  validates :deadline, presence: true

end
