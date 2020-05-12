class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :img, ImgUploader
  belongs_to :user, optional: true


end
