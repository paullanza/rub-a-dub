class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tubs, dependent: :destroy
  has_many :soaks, dependent: :destroy
  has_many :booked_tubs, through: :tubs, source: :soaks

  validates :first_name, :last_name, presence: true
end
