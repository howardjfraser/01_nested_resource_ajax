module MessagesHelper
  def more
    link_to 'View all messages', person_messages_path(@person) if @person.messages.count > 3
  end
end
