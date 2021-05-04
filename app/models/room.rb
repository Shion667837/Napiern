class Room < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }
  mount_uploader :img, ImgUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
