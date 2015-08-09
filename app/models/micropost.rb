class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  has_many :favoriter_relations, class_name: "Favorite", foreign_key: "favoritepost_id" dependent: :destroy
  has_many :favoriter_users, through: :favoriter_relations, source: :favoriter
    
end
