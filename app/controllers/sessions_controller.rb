# coding: utf-8
class SessionsController < ApplicationController
  # ログイン
  def create
    member = Member.authenticate(params[:login_id], params[:password])
    if member
      session[:member_id] = member.id
      redirect_to session[:previous_url], notice: "ログインしました。"
    else
      flash.alert = "IDとパスワードが一致しません。"
      redirect_to params[:from]
    end
  end

  # ログアウト
  def destroy
    session.delete(:member_id)
    redirect_to :root, notice: "ログアウトしました。"
  end
end
