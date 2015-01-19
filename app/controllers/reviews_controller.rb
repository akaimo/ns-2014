# coding: utf-8
class ReviewsController < ApplicationController
  before_filter :login

  #新規
  def new
    @tour = TourInfomation.find_by_id(params[:tour_infomation_id])
    @review = Review.new
  end

  #編集
  def edit
    @tour = TourInfomation.find_by_id(params[:tour_infomation_id])
    @review = Review.find_by_id(params[:id])
  end

  #作成
  def create
    @tour = TourInfomation.find_by_id(params[:tour_infomation_id])
    @review = Review.new(member_id: @current_member.id, tour_infomation_id: params[:tour_infomation_id], title: params[:review][:title], content: params[:review][:content])
    if @review.save
      redirect_to tour_infomation_path(params[:tour_infomation_id]), notice: "レビューしました。"
    else
      render "new"
    end
  end

  #更新
  def update
    @tour = TourInfomation.find_by_id(params[:tour_infomation_id])
    @review = Review.find(params[:id])
    @review.assign_attributes(member_id: @current_member.id, tour_infomation_id: params[:tour_infomation_id], title: params[:review][:title], content: params[:review][:content])
    if @review.save
      redirect_to tour_infomation_path(params[:tour_infomation_id]), notice: "レビューを更新しました。"
    else
      render "edit"
    end
  end

  #削除
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tour_infomation_path(params[:tour_infomation_id]), notice: "レビューを削除しました。"
  end
end
