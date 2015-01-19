class TourInfomation < ActiveRecord::Base
  has_many :details, dependent: :destroy
  has_many :reviews, dependent: :destroy

  attr_accessible :tourname, :tourcontent, :category, :subcategory

  validates :tourname, presence: true
  validates :tourcontent, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true

  private
  class << self
    def search(query)
      rel = order("updated_at DESC")
      if query.present?
        rel = rel.where("tourname LIKE ? OR tourcontent LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
