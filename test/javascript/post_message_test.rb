require 'test_helper'
require 'capybara/poltergeist'

class PostMessageTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.current_driver = :poltergeist
  end

  test 'post message using ajax' do
    view_michael
    post_new_message
    check_new_message
  end

  private

  def view_michael
    visit '/people'
    click_link 'Michael Phillip'
  end

  def show_older_messages
    click_on 'View older messages'
    assert page.has_css? '#older-messages'
    refute page.has_css? '.new-message'
  end

  def post_new_message
    @msg = sample_string
    fill_in('message_body', with: @msg)
    click_on 'Post'
  end

  def check_new_message
    assert page.has_content? @msg
    assert page.has_css? '.new-message'
  end

  def check_older_messages
    assert page.has_css? '#older-messages'
  end
end
