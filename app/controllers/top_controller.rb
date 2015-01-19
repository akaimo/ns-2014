# coding: utf-8
class TopController < ApplicationController
  def index
    @sora = TourInfomation.where(category: "空")
    @umi = TourInfomation.where(category: "海")
    @yama = TourInfomation.where(category: "山")
    @norimono = TourInfomation.where(category: "乗り物")
    @kankou = TourInfomation.where(category: "観光")
  end

  def about
  end

  def login
  end
end
