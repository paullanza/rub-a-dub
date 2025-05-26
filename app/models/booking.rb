class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tub

  STATUSES = ["pending", "approved", "denied"].freeze

  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUSES, message: "%{value} is not a valid status" }

  validate :no_overlap
  validate :cannot_book_own_tub
  validate :end_date_after_start

  before_save :calculate_cost

    def approve!
      self.status = "approved"
    end

    def deny!
      self.status = "denied"
    end

  private

  def calculate_cost
    return 0 unless start_date && end_date && tub

    num_days = (end_date - start_date).to_i
    num_days = 1 if num_days < 1

    self.cost = num_days * tub.price
  end

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

  def cannot_book_own_tub
    return unless tub && user

    if tub.user_id == user_id
      errors.add(:base, "You cannot book your own tub.")
    end
  end

  def end_date_after_start
    if end_date < start_date
      errors.add(:end_date, "End date must be after start date.")
    end
  end
end
