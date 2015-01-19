# coding: utf-8
class Admin::TourInfomationsController < Admin::Base
  def index
    @tour = TourInfomation.order("id")
    session[:tour_infomation] = nil
    session[:detail] = nil
  end

  #検索
  def search
    @tour = TourInfomation.search(params[:q])
    session[:tour_infomation] = nil
    session[:detail] = nil
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

  def new
    if params[:tour_infomation]
      session[:tour_infomation] = params[:tour_infomation]
      @tour = TourInfomation.new(params[:tour_infomation])
      render @tour.valid? ? :confirm : :new
    elsif session[:tour_infomation]
      @tour = TourInfomation.new(session[:tour_infomation])
    else
      @tour = TourInfomation.new
      @tour.category = "空"
    end
  end

  def create
    @tour = TourInfomation.new(params[:tour_infomation])
    if @tour.save
      session[:tour_infomation] = nil
      redirect_to new_admin_tour_infomation_detail_path(@tour), notice: "ツアーを登録しました。"
    else
      render "new"
    end
  end

  def edit
    @tour = TourInfomation.find(params[:id])
  end

  def update
    @tour = TourInfomation.find(params[:id])
    @tour.assign_attributes(params[:tour_infomation])
    if @tour.valid?
      if params[:tour_infomation][:subcategory]
        @tour.save
        redirect_to :admin_tour_infomations, notice: "ツアーを更新しました。"
      else
        @tour.errors.add(:subcategory, "にチェックをしてください。")
        render "edit"
      end
    else
      render "edit"
    end
  end

  def destroy
    @tour = TourInfomation.find(params[:id])
    @tour.destroy
    redirect_to :admin_tour_infomations, notice: "ツアーを削除しました。"
  end
end
