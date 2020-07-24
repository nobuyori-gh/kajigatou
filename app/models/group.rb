class Group < ApplicationRecord
  has_many :group_requests, dependent: :destroy
  has_many :request_users, through: :group_requests,source: :user
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  validates :name, presence: true
  attachment :image
end
