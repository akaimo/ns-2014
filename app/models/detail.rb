# coding: utf-8

class Detail < ActiveRecord::Base
  belongs_to :tour_infomation
  has_many :reservations

  attr_accessible :tour_infomation, :start, :finish, :price, :limit, :lowst

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :lowst, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validate :check_start, :check_finish, :check_limit_lowst

  def check_start
    if start.present? && start < Date.today
      errors.add(:start, "は現在よりも後日にしてください。")
    end
  end

  def check_finish
    if start.present? && start > finish
      errors.add(:finish, "は開始日よりも後日にしてください。")
    end
  end

  def check_limit_lowst
    if limit.present? && lowst.present? && limit < lowst
      errors.add(:lowst, "は最大人数よりも小さくしてください。")
    end
  end
end
