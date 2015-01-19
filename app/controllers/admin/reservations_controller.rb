# coding: utf-8
class Admin::ReservationsController < Admin::Base
    #一覧
  def index
    @reservation = Reservation.order(:id)
  end

  #キャンセル申請受諾
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :admin_reservations, notice: "予約を削除しました。"
  end
end
