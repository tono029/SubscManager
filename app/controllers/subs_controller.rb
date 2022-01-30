class SubsController < ApplicationController
  before_action :set_sub, only: %i[ show edit update destroy ]
  # ログイン済みのユーザーにのみアクセスを許可する。
  before_action :authenticate_user!

  # GET /subs or /subs.json
  def index
    @subs_for_fee = Sub.where(user_id: current_user.id)
    @subs = Sub.where(user_id: current_user.id).page(params[:page]).per(5)
    # グラフ用のデータ(金額でソート)
    @chart = @subs_for_fee.order(fee: "DESC").pluck("sub_name", "fee")
    
    @total_fee = 0
    @subs_for_fee.each do |sub|
      if sub.period == "/月"
        @total_fee += sub.fee
      else
        @total_fee += sub.fee / 12
      end
    end
  end

  # GET /subs/1 or /subs/1.json
  def show
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
    
  end

  # POST /subs or /subs.json
  def create
    # form にてモデルを指定している場合、params[:model][:属性]にする。
    @sub = Sub.new(sub_name: params[:sub][:sub_name], 
                   fee: params[:sub][:fee],
                   period: params[:sub][:period],
                   url: params[:sub][:url],
                   user_id: current_user.id)
    if @sub.save
      redirect_to subs_url, notice: "登録に成功しました。"
    # 保存できないとき
    else
      flash.now[:alert] = "入力に誤りがあります。"
      render "subs/new"
    end
  end

  # PATCH/PUT /subs/1 or /subs/1.json
  def update
    if @sub.update(sub_params)
      redirect_to subs_url, notice: "編集を適用しました。"
    # 編集内容がvalidationにひっかかったら。
    else
      # 描画するviewファイルを指定。
      render "subs/edit"
    end
  end

  # DELETE /subs/1 or /subs/1.json
  def destroy
    @sub.destroy
    redirect_to subs_url, notice: "削除が完了しました。"
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_params
      params.require(:sub).permit(:sub_name, :fee, :url, :user_id, :period)
    end
end
