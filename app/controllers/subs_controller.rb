class SubsController < ApplicationController
  before_action :set_sub, only: %i[ show edit update destroy ]
  # ログイン済みのユーザーにのみアクセスを許可する。
  before_action :authenticate_user!

  # GET /subs or /subs.json
  def index
    @subs = Sub.where(user_id: current_user.id)
    @total_fee = 0
    
    @subs.each do |sub|
      @total_fee += sub.fee
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
                   user_id: current_user.id)
    if @sub.save

      redirect_to subs_url
    else
      render "subs/new"
    end
  end

  # PATCH/PUT /subs/1 or /subs/1.json
  def update
    @sub.update(sub_params)
    redirect_to subs_url
  end

  # DELETE /subs/1 or /subs/1.json
  def destroy
    @sub.destroy
    redirect_to subs_url
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_params
      params.require(:sub).permit(:sub_name, :fee, :user_id)
    end
end
