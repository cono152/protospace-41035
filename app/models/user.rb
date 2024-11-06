class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :prototypes
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :comments  # commentsテーブルとのアソシエーションを有効化

  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end