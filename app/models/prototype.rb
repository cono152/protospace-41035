class Prototype < ApplicationRecord
  belongs_to :user
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :tags

  validates :title, :catch_copy, :concept, :image, presence: true
  validates :title, length: { maximum: 100 }
  validates :catch_copy, length: { maximum: 200 }

  before_save :set_default_values

  private

  def set_default_values
    #self.views_count ||= 0
  end
end