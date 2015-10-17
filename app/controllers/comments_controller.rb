class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pin, only: [:create]

  
  
  def create
    @comment = current_user.comments.build(comments_params)
    @comment.pin_id = @pin.id
    if @comment.save
      redirect_to @pin, notice: 'comment was succefully added.'
    else
      redirect_to @pin, notice: 'Oops something went wrong!.'
    end
  end

  
  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find_by(id: params[:pin_id])
    end

       # Never trust parameters from the scary internet, only allow the white list through.
    def comments_params
      params.require(:comment).permit(:body, :user_id, :pin_id)
    end
end