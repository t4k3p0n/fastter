class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :notifications, dependent: :destroy
  mount_uploader :img, ImgUploader
  belongs_to :user, optional: true
  validates :img, presence: true
  def user
    return User.find_by(id: self.user_id)
  end
end
