class MessagesController < ApplicationController
  before_action :find_person

  def index
    @messages = @person.messages.all
  end

  def create
    @message = @person.messages.build message_params
    respond_to do |format|
      if @message.save
        format.html { redirect_to @person }
      else
        format.html { render('people/show') }
      end
      format.js
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
