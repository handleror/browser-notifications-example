class MessagesController < ApplicationController
  before_action :assign_and_authenticate_account

  def create
    @message = @account.messages.build(message_params)
    @message.save

    respond_to do |format|
      format.js { render :create }
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
