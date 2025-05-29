class Tub < ApplicationRecord
  belongs_to :user
  has_many :soaks, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  SIZES = ["extra small", "small", "medium", "extra medium", "large", "extra large"].freeze
  CATEGORIES = ["claw", "standard", "jet", "jacuzzi"].sort.freeze

  validates :name, :description, :price, :size, :category, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 25, too_short: "%{count} characters is the minimum allowed" }
  validates :size, inclusion: { in: SIZES, message: "%{value} is not a valid size." }
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category." }

  def short_desc
    if description.length > 60
      "#{description[0, 60]}..."
    else
      description
    end
  end
end
