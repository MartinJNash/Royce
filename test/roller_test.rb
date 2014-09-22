require 'test_helper'

describe "Basic tests" do

  before do
    User.delete_all
  end

  def user
    @user ||= User.create
  end

  it 'can create role' do
    role = Royce::Role.create(name: 'some_role')
    role.wont_be_nil
  end

  it 'Can create user' do
    User.create.wont_be_nil
  end

  it 'Creates roles automatically' do
    Royce::Role.count.must_be :>, 0
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

    it 'can add with Role object' do
      User.available_roles.each do |role|
        user.add_role role
      end
      user.roles.count.must_equal User.available_roles.count
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
    user.has_role?('user').must_equal false
    user.has_role?(:user).must_equal false
    user_role = Royce::Role.find_by(name: 'user')
    user.has_role?(user_role).must_equal false

    user.add_role 'user'

    user.has_role?('user').must_equal true
    user.has_role?(:user).must_equal true
    user.has_role?(user_role).must_equal true
  end

  it 'Can tell acceptable roles' do
    user.allowed_role?('zxcv').must_equal false
    user.allowed_role?('user').must_equal true
    user.allowed_role?(:zxcv).must_equal false
    user.allowed_role?(:user).must_equal true

    user_role = Royce::Role.find_or_create_by(name: 'user')
    user.allowed_role?(user_role).must_equal true

    bad_role = Royce::Role.find_or_create_by(name: 'zxcv')
    user.allowed_role?(bad_role).must_equal false
  end

  it 'Has name methods' do
    User.available_roles.each do |role|
      method_name = "#{role}?"
      user.send(method_name).must_equal false
      user.add_role role
      user.send(method_name).must_equal true
    end
  end

  it 'Has bang methods to assign a role' do
    user.has_role?(:admin).must_equal false
    user.admin!
    user.has_role?(:admin).must_equal true

    user.has_role?(:editor).must_equal false
    user.editor!
    user.has_role?(:editor).must_equal true
  end

  it "knows allowed roles" do
    User.available_roles.each do |role|
      user.allowed_role?(role).must_equal true
    end
  end

  it "has named scopes for each role" do
    User.available_roles.each do |role|
      User.send role.name.pluralize.to_sym
    end
  end

  it "has a list of roles" do
    user.role_list.must_equal []

    user.add_role :user
    user.role_list.must_equal ['user']

    user.add_role :admin
    user.role_list.must_equal ['user', 'admin']
  end

  it "doesn't get double roles" do
    user.roles.count.must_equal 0

    user.admin!
    user.roles.count.must_equal 1

    user.admin!
    user.roles.count.must_equal 1
  end


end

