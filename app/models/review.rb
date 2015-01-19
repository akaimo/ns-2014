class Review < ActiveRecord::Base
  belongs_to :tour_infomation
  belongs_to :member

  attr_accessible :member_id, :tour_infomation_id, :title, :content

  validates :member_id, presence: true
  validates :tour_infomation_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates_uniqueness_of :member_id, :scope => :tour_infomation_id, message: :invalid_coment
end
