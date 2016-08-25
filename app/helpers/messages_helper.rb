module MessagesHelper
  def all_messages(limit = 3)
    link_to 'View all messages', person_messages_path(@person) if @person.messages.count > limit
  end
end
