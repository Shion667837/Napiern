class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional:true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true

  validates :people, numericality: { greater_than_or_equal_to: 1 }
  validate :date_before_start
  validate :date_before_finish
  def date_before_start
    return if start_date.blank?
    errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
  end

  def date_before_finish
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
  end

end
