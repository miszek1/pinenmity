class Api::V1::PinsController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  respond_to :json

  def index
    @pins = Pin.all
    render json: @pins
  end

  def create
    pin = Pin.create(pin_params)
    render json: pin
  end

  def update
    pin = Pin.update(pin_params)
    render json: pin
  end

  def destroy
    Pin.find(params[:id]).delete
    render json: {success: true, message: "Pin was deleted susccesfully"}
  end

  private

  def pin_params
    params.require(:pin).permit(:description, :image)
  end

end
