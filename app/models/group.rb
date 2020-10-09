class Group < ApplicationRecord
  has_many :group_requests, dependent: :destroy
  has_many :request_users, through: :group_requests,source: :user

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  has_many :group_tasks, dependent: :destroy

  validates :name, presence: true,length:{in: 2..10}
  validates :description, length:{maximum: 30}
  attachment :image
end
