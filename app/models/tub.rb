class Tub < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  SIZES = ["extra small", "small", "medium", "extra medium", "large", "extra large"].freeze
  CATEGORIES = ["claw", "standard", "jet", "jacuzzi"].sort.freeze

  validates :name, :description, :price, :size, :category, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 25, too_short: "%{count} characters is the minimum allowed" }
  validates :size, inclusion: { in: SIZES, message: "%{value} is not a valid size." }
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category." }
end
