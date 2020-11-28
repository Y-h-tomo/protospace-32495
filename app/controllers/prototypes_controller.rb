class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_prototype, only: %i[edit show update]
  before_action :move_to_index, only: %i[edit]

def index
  @prototypes = Prototype.all
end

 def new
   @prototype = Prototype.new
 end

#  プロトタイプ投稿に成功したらトップページに、失敗したら投稿ページに遷移
 def create
  @prototype = Prototype.create(prototype_params)
  if @prototype.save
    redirect_to root_path
  else
    render  :new
  end
 end

#  プロトタイプ更新に成功したら詳細ページに、失敗したら編集画面に遷移
 def update
  if @prototype.update(prototype_params)
   redirect_to prototype_path
  else
   render :edit
  end
end

# コメント投稿のための@commentと、部分テンプレートに変数を渡すための@commentsを定義
def show
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)
end

def edit
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  # ログインユーザーとプロトタイプ投稿者が異なる場合、編集画面に移動するとトップページリダイレクトさせる
  def move_to_index
    unless current_user == @prototype.user
      redirect_to action: :index
    end
  end

  # 繰り返しの多い処理をモジュール化
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end