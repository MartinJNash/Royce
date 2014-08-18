require 'test_helper'

describe "Basic tests" do

  before do
    User.delete_all
  end

  def user
    @user ||= User.create
  end

  it 'can create role' do
    role = Roller::Role.create
    role.wont_be_nil
  end

  it 'Can create user' do
    User.create.wont_be_nil
  end

  it 'Creates roles automatically' do
    Roller::Role.count.must_be :>, 0
  end

  describe 'adding roles' do

    it 'can add with string' do
      user.add_role 'user'
      user.roles.count.must_equal 1
    end

    it 'can add with symbol' do
      user.add_role :user
      user.roles.count.must_equal 1
    end

  end


  describe 'Removing roles' do

    it 'can remove with string' do
      user.add_role 'user'
      user.remove_role 'user'
      user.roles.count.must_equal 0
    end

    it 'can remove with symbol' do
      user.add_role :user
      user.remove_role :user
      user.roles.count.must_equal 0
    end

  end

  it 'Can query role name' do
    user.add_role 'user'
    user.has_role?('user').must_equal true
    User.available_roles
  end

end

