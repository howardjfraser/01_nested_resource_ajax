require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @person = people(:david)
  end

  test 'index' do
    get person_messages_path @person
    assert_response :success
    assert_select 'h1', 'Messages'
    assert_select 'div', @person.messages.last.body
    assert_select 'nav', "About People"
  end

  test 'valid create' do
    assert_difference 'Message.count', 1 do
      post person_messages_path @person, params: { message: { body: 'zz' } }
    end
    assert_response :redirect
  end

  test 'invalid create' do
    assert_no_difference 'Message.count' do
      post person_messages_path @person, params: { message: { body: '' } }
    end
    assert_response :success
    assert_select '.field_with_errors', 'Message can’t be blank'
  end
end
