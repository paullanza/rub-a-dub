class Tub < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :soaks, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  SIZES = ["extra small", "small", "medium", "extra medium", "large", "extra large"].freeze
  CATEGORIES = [
                "Luxury",
                "Rustic",
                "Rooftop",
                "Forest Retreat",
                "Scenic View",
                "Indoor Spa",
                "Outdoor Wood-Fired",
                "Tiny Tub",
                "Party-Ready",
                "Romantic Getaway",
                "Cold Plunge",
                "Family-Friendly",
                "Minimalist",
                "Eco-Friendly",
                "Pet-Friendly",
                "Japanese Onsen",
                "Swim Spa",
                "Mobile Tub (Trailer)",
                "Cabin Tub",
                "Zen Garden Tub"
              ].sort.freeze

  validates :name, :description, :price, :size, :category, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 25, too_short: "%{count} characters is the minimum allowed" }
  validates :size, inclusion: { in: SIZES, message: "%{value} is not a valid size." }
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category." }

  pg_search_scope :search_by_name_and_description,
                  against: [ :name, :description ],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  def short_desc
    if description.length > 40
      "#{description[0..40]}..."
    else
      description
    end
  end
end
