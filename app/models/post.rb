class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :companies, dependent: :destroy
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many_attached :images
  mount_uploader :stockprice, ImageUploader

  def user
    User.find_by(id: user_id)
  end
end
