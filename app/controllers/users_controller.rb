class UsersController < ApplicationController

# ユーザー詳細画面で部分テンプレートに変数を渡すため、@prototypesを定義
  def show
    @user =  User.find(params[:id])
    @prototypes = @user.prototypes
  end
end
