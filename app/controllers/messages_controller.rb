class MessagesController < ApplicationController
  # handle manual refresh after validation fail
  def index
    @person = Person.find(params[:person_id])
    redirect_to @person
  end

  def create
    @person = Person.find(params[:person_id])
    @message = @person.messages.build message_params
    if @message.save
      redirect_to @person
    else
      render 'people/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :person_id)
  end
end
