# coding: utf-8
class ReservationsController < ApplicationController
  before_filter :login, only: :new
  before_filter :check_limit, only: [:new, :create]
  # 予約したツアーの詳細
  def show
    @reservation = Reservation.find_by_id(params[:id])
    @detail = Detail.joins(:reservations).where(:reservations => {:id => @reservation})
    @tour = TourInfomation.joins(:details).where(:details => {:id => @detail})
  end

  #新規
  def new
    @member = @current_member
    if params[:reservation]
      @detail = Detail.find_by_id(params[:detail][:id])
      @tour = TourInfomation.find_by_id(@detail.tour_infomation_id)
      session[:reservation] = {
        member_id: @member.id,
        detail_id: @detail.id,
        people: params[:reservation][:people],
        food: params[:reservation][:food]
      }
      @reservation = Reservation.new(session[:reservation])
      if @c.to_i < session[:reservation][:people].to_i
        @reservation.errors.add(:people, "が予約できる上限を超えています。")
        render "new"
      else
        render @reservation.valid? ? :confirm : :new
      end
    elsif params[:id]
      @detail = Detail.find_by_id(params[:id])
      @tour = TourInfomation.find_by_id(@detail.tour_infomation_id)
      @reservation = Reservation.new
    elsif request.get? && session[:reservation]
      @detail = Detail.find_by_id(session[:reservation][:detail_id])
      @tour = TourInfomation.find_by_id(@detail.tour_infomation_id)
      @reservation = Reservation.new(session[:reservation])
      render @reservation.valid? ? :confirm : :new
    end
  end

  #作成
  def create
    @reservation = Reservation.new(session[:reservation])
    if @c.to_i < session[:reservation][:people].to_i
      @reservation.errors.add(:people, "が予約できる上限を超えています。")
      @tour = TourInfomation.find_by_id(@detail.tour_infomation_id)
      render "new"
    elsif @reservation.save
      session[:reservation] = nil
      redirect_to :root, notice: "予約をしました。"
    else
      @tour = TourInfomation.find_by_id(@detail.tour_infomation_id)
      render "new"
    end
  end

  # ツアーのキャンセル
  def edit
    @reservation = Reservation.find(params[:id])
    if @reservation.canceld
      render "cancel"
    else
      render "edit"
    end
  end

  # キャンセル登録
  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.canceld == nil
    @reservation.assign_attributes(canceld: true)
      if @reservation.save
        redirect_to @current_member, notice: "キャンセル申請をしました。"
      else
        render "edit"
      end
    else
      @reservation.assign_attributes(canceld: nil)
      if @reservation.save
        redirect_to @current_member, notice: "キャンセル申請を取消しました。"
      else
        render "cancel"
      end
    end
  end
end
