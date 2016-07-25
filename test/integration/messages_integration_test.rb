require 'test_helper'

class MessagesIntegrationTest < ActionDispatch::IntegrationTest
  test 'post message' do
    message = sample_string
    visit '/people'
    first('span').click_link('view')
    page.has_content? 'People / '
    fill_in('message_body', with: message)
    click_on 'Post'
    page.has_content? 'message'
  end
end
