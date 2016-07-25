require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  def setup
    @person = people(:david)
  end

  test 'get index' do
    get people_path
    assert_response :success
    assert_select 'h1', 'People'
  end

  test 'get show' do
    get person_path @person
    assert_response :success
    assert_select 'h1', "People / #{@person.name}"
  end

  test 'get new' do
    get new_person_path
    assert_response :success
    assert_select 'h1', 'People / New'
  end

  test 'valid create' do
    assert_difference 'Person.count', 1 do
      post people_path, params: { person: { name: sample_string, job_title: sample_string } }
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', "People / #{Person.last.name}"
    assert_select '.flash', "#{Person.last.name} has been created"
  end

  test 'invalid create' do
    assert_no_difference 'Person.count' do
      post people_path, params: { person: { name: '' } }
    end
    assert_response :success
    assert_select 'h1', 'People / New'
  end

  test 'get edit' do
    get edit_person_path @person
    assert_response :success
    assert_select 'h1', 'People / Edit'
  end

  test 'valid update' do
    patch person_path @person, params: { person: { name: sample_string } }
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', "People / #{@person.reload.name}"
    assert_select '.flash', "#{@person.name} has been updated"
  end

  test 'invalid update' do
    patch person_path @person, params: { person: { name: '' } }
    assert_response :success
    assert_select 'h1', 'People / Edit'
  end

  test 'destroy' do
    assert_difference 'Person.count', -1 do
      delete person_path @person
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'People'
  end
end
