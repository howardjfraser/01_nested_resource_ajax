class MessagesController < ApplicationController
  before_action :find_person

  # handle manual refresh after validation fail
  def index
    @messages = @person.messages.all
  end

  def create
    @message = @person.messages.build message_params
    save_message || render('people/show')
  end

  private

  def message_params
    params.require(:message).permit(:body, :person_id)
  end

  def find_person
    @person = Person.find(params[:person_id])
  end

  def save_message
    redirect_to @person if @message.save
  end
end
