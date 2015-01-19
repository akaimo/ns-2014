# coding: utf-8
class Admin::ReviewsController < Admin::Base
  #一覧
  def index
    @review = Review.order("updated_at DESC")
  end

  #削除
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path, notice: "レビューを削除しました。"
  end
end
