class Event < ApplicationRecord
  require 'time'

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  belongs_to :host, class_name: "User"

  validates :start_date, presence: true
  validate :start_date_cannot_be_past

  validates :duration, presence: true
  validate :correct_duration

  validates :title, presence: true, length: {in: 5..140}

  validates :location, presence: true

  validates :description, presence: true, length: {in: 20..1000}

  validates :price, presence: true
  validate :correct_price



  def start_date_cannot_be_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end


  def correct_duration
    if (duration.to_i % 5) != 0 || duration.to_i < 0
      errors.add(:duration, 'must be a multiple of 5 and >0')
    end
  end

  def correct_price
    if price.to_i < 1 || price.to_i > 1000
      errors.add(:price, 'must be between 1 and 1000')
    end
  end

end
