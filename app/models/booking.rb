class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tub

  validates :start_date, :end_date, presence: true
  validate :no_overlap

  private

  def no_overlap
    return unless start_date && end_date

    booking = Booking
              .where(tub_id: tub_id)
              .where.not(id: id)
              .where("start_date < ? AND end_date > ?", end_date, start_date)
              .exists?

    if booking
      errors.add(:base, "Booking dates overlap with an existing booking for this tub.")
    end
  end
end
