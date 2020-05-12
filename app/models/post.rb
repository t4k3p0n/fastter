class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :img, ImgUploader
  belongs_to :user, optional: true
  validates :img, presence: true
  def user
    return User.find_by(id: self.user_id)
  end
end
