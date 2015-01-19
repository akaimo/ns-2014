class TourInfomationsController < ApplicationController
  #検索
  def search
    @tour = TourInfomation.search(params[:q])
  end

  def category
    @tour = TourInfomation.where(category: params[:category]).order("updated_at DESC")
    render "search"
  end

  def show
    @tour = TourInfomation.find(params[:id])
    @details = Detail.where(tour_infomation_id: params[:id])
    @review = Review.where(tour_infomation_id: params[:id])
    @reservation = Reservation.joins(:detail).where(:details => {:id => @details})
  end
end
