class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates_presence_of :username
         mount_uploader :image, ImageUploader
         
         has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
         has_many :followings, through: :following_relationships
         has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
         has_many :followers, through: :follower_relationships
         has_many :posts, dependent: :destroy
         has_many :comments
         has_many :posts, foreign_key: :user_id, dependent: :destroy
         has_many :participations, foreign_key: :user_id, dependent: :destroy
        def following?(other_user)
          following_relationships.find_by(following_id: other_user.id)
        end
      
        def follow!(other_user)
          following_relationships.create!(following_id: other_user.id)
        end
      
        def unfollow!(other_user)
          following_relationships.find_by(following_id: other_user.id).destroy
        end

        def posts
          return Post.where(user_id: self.id)
        end
end
