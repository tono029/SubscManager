class SubsController < ApplicationController
  before_action :set_sub, only: %i[ show edit update destroy ]

  # GET /subs or /subs.json
  def index
    @subs = Sub.all
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
    @sub = Sub.new(sub_params)
    if @sub.save

      redirect_to subs_path
    else
      render "subs/new"
    end
  end

  # PATCH/PUT /subs/1 or /subs/1.json
  def update
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
      params.require(:sub).permit(:sub_name, :fee)
    end
end
