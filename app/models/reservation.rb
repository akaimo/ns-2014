class Reservation < ActiveRecord::Base
  belongs_to :detail
  belongs_to :member

  attr_accessible :member_id, :detail_id, :people, :food, :canceld

  validates :member_id, presence: true
  validates :detail_id, presence: true
  validates :people, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100, allow_blank: true }
  validates :food, presence: true
end
