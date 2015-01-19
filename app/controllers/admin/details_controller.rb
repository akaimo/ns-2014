# coding: utf-8
class Admin::DetailsController < Admin::Base
  def new
    @tour = TourInfomation.find(params[:tour_infomation_id])
    if params[:detail]
      session[:detail] = params[:detail]
      @detail = Detail.new(params[:detail])
      render @detail.valid? ? :confirm : :new
    elsif session[:detail]
      @detail = Detail.new(session[:detail])
    else
      @detail = Detail.new
    end
  end

  def create
    @tour = TourInfomation.find(params[:tour_infomation_id])
    @detail = Detail.new(params[:detail])
    @detail.tour_infomation = @tour
    if @detail.save
      session[:detail] = nil
      redirect_to [:admin, @tour], notice: "ツアー詳細を登録しました。"
    else
      render "nwe"
    end
  end

  def edit
    @tour = TourInfomation.find(params[:tour_infomation_id])
    @detail = Detail.find(params[:id])
  end

  def update
    @tour = TourInfomation.find(params[:tour_infomation_id])
    @detail = Detail.find(params[:id])
    @detail.assign_attributes(params[:detail])
    if @detail.save
      redirect_to [:admin, @tour], notice: "リンクを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @tour = TourInfomation.find(params[:tour_infomation_id])
    @detail = Detail.find(params[:id])
    @detail.destroy
    redirect_to [:admin, @tour], notice: "リンクを削除しました。"
  end

  # 複製
  def copy
    @tour = TourInfomation.find(params[:tour_infomation_id])
    @old_detail = Detail.find(params[:id])
    @detail = Detail.new
    @detail = @old_detail
    render "new"
  end
end