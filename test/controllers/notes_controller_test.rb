require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test 'get about' do
    get root_url
    assert_response :success
    assert_select 'h1', 'Nested Resources'
  end
end
