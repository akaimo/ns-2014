# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  after_filter :location

  class Forbidden < StandardError; end

  def location
    if (request.fullpath != "/login" && request.fullpath != "/session" && request.fullpath != "/members/new" && request.fullpath != "/members")
      session[:previous_url] = request.fullpath
    end
  end

  private
  def authorize
    if session[:member_id]
      @current_member = Member.find_by_id(session[:member_id])
      session.delete(:member_id) unless @current_member
    end
  end

  def login_required
    raise Forbidden unless @current_member
  end

  def login
    unless @current_member
      redirect_to login_path, notice: "ここから先は会員のみご利用いただけます。ログインしてください。"
    end
  end

  def check_limit
    if params[:reservation]
      @detail = Detail.find_by_id(params[:detail][:id])
    elsif request.get? && session[:reservation]
      @detail = Detail.find_by_id(session[:reservation][:detail_id])
    else
      @detail = Detail.find_by_id(params[:id])
    end
    @already_reservation = Reservation.where(detail_id: @detail.id)
    c = 0
    @already_reservation.each do |already|
      c = c + already.people.to_i
    end
    @c = @detail.limit.to_i - c
  end
end
