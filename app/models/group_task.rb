class GroupTask < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :group_comments, dependent: :destroy
  has_many :thank_yous, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :rep, presence: true
  validates :deadline, presence: true

  def thank_you_by?(user)
    thank_yous.where(user_id: user.id).exists?
  end
end
