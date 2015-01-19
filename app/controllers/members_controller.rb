# coding: utf-8
class MembersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  #詳細
  def show
    @member = @current_member
    @reservation = Reservation.where(member_id: @member)
    @tour = TourInfomation.joins(:details => :reservations).where(:reservations => {:member_id => @member.id})
  end

  #新規
  def new
    @member = Member.new
  end

  #編集
  def edit
    @member = @current_member
  end

  #作成
  def create
    @member = Member.new(params[:member])
    if @member.save
      session[:member_id] = @member.id
      redirect_to session[:previous_url], notice: "会員登録をしました。"
    else
      render "new"
    end
  end

  #更新
  def update
    @member = @current_member
    @member.assign_attributes(params[:member])
    if @member.save
      if session[:reservation].presence
        redirect_to :controller => "reservations", :action => "new"
      else
        redirect_to :member, notice: "アカウント情報を更新しました。"
      end
    else
      render "edit"
    end
  end
end
