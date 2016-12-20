class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to message_comments_path
    else
      render "new"
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to message_comments_path
    else
      render "edit"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      render status: 200
    else
      render json: ErrorSerializer.serialize(@comment.errors), status: 422
    end
  end

private

def message_params
  params.require(:message).permit(:title, :body, :user_id)
end

end
