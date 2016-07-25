require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = messages(:david_one)
  end

  test 'valid' do
    assert @message.valid?
  end

  test 'body is required' do
    @message.body = nil
    refute @message.valid?
  end

  test 'body max length' do
    @message.body = 'a' * 96
    assert @message.valid?
    @message.body = 'a' * 97
    refute @message.valid?
  end

  test 'person is required' do
    assert @message.person.valid?
    @message.person = nil
    refute @message.valid?
  end
end
