class MessagesController < ApplicationController
  before_action :find_person

  # handle manual refresh after validation fail
  def index
    redirect_to @person
  end

  def create
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

  def find_person
    @person = Person.find(params[:person_id])
  end
end
