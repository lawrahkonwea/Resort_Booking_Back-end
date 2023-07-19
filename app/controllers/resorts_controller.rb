class ResortsController < ApplicationController
  def index
    @resorts = Resort.all
    render json: @resorts
  end

  def show
    # resort.includes(:user).find(params[:id])
    render json: @resorts
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      render json: { message: 'Resort created' }, status: :created
    else
      render json: { error: 'Unable to create resort' }, status: :unprocessable_entity
    end
  end

  private

  def resort_params
    params.require(:resort)
      .permit(:name, :location, :price, :guests_amount, :image_url)
      .with_defaults(user_id: current_user.id)
  end
end
