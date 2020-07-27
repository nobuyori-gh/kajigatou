class GroupTask < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :title, presence: true
  validates :body, presence: true

  enum status: {
    未完了: false,
    完了: true
  }

end
