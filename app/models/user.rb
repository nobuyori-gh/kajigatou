class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :group_requests, dependent: :destroy
  def already_requested?(group)
    self.group_requests.exists?(group_id: group.id)
  end

  has_many :group_users, dependent: :destroy
  def already_belong?(group)
    self.group_users.exists?(group_id: group.id)
  end

  has_many :groups, through: :group_users

  has_many :group_tasks, dependent: :destroy

  has_many :group_comments, dependent: :destroy

  has_many :thank_yous, dependent: :destroy

  validates :name, length:{in: 2..20}
  attachment :image
end
