# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Test User', email: 'test@email.com', password: '123', password_confirmation: '123')
  end

  test 'email address should be unique' do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test 'passsword should be present' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end
end
