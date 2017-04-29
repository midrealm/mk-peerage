class Poll < ApplicationRecord
  has_many :advisings
  has_many :candidates, through: :advisings
  has_many :users, through: :advisings

  validate :end_date_cannot_be_before_start_date
  validates :start_date, :end_date, presence: true

  def end_date_cannot_be_before_start_date
    unless end_date.nil? || start_date.nil?
      if end_date < start_date
        errors.add(:end_date, 'end_date cannot be before start_date')
      end
    end
  end
end
