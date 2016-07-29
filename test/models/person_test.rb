require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:david)
  end

  test 'valid' do
    assert @person.valid?
  end

  test 'name is required' do
    @person.name = nil
    refute @person.valid?
  end

  test 'name should be 48 chars or less' do
    @person.name = 'a' * 48
    assert @person.valid?
    @person.name = 'a' * 49
    refute @person.valid?
  end

  test 'job_title is required' do
    @person.job_title = nil
    refute @person.valid?
  end

  test 'job_title should be 48 chars or less' do
    @person.job_title = 'a' * 48
    assert @person.valid?
    @person.job_title = 'a' * 49
    refute @person.valid?
  end

  test 'bio is required' do
    @person.bio = nil
    refute @person.valid?
  end

  test 'bio should be 96 chars or less' do
    @person.bio = 'a' * 96
    assert @person.valid?
    @person.bio = 'a' * 97
    refute @person.valid?
  end

  test 'first name' do
    assert @person.name == 'David Jones'
    assert @person.first_name == 'David'
    @person.name = 'Keith'
    assert @person.first_name == 'Keith'
  end

  test 'dependent destroy of messages' do
    message_count = @person.messages.count
    assert message_count > 0

    assert_difference 'Message.count', -message_count do
      @person.destroy
    end
  end

  test 'default sort order' do
    messages = people(:david).messages
    assert messages.first == messages(:david_three)
  end
end
