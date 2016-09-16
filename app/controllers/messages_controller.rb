class MessagesController < ApplicationController
  before_action :authenticate_user!
  action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = current_user.messages.order("created_at DESC")
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  def new
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "The message has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @message = current_user.messages.find(params[:id])
  end

  def update
    @message = current_user.messages.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to messages_path, notice: "The message has been successfully updated."
    else
      render action: "edit"
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
