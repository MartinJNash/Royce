[![Gem Version](https://badge.fury.io/rb/royce.svg)](http://badge.fury.io/rb/royce)

Royce
======

Roles in Rails.

## Installation

Add this to your Gemfile.

    gem 'royce'

Be sure to run `bundle install`.

Run this in your terminal.

    rails g royce:install

And run `rake db:migrate`.

Add this to a model.

    royce_roles %w[ owner editor administrator ]


## In Depth

Adding royce to a model is super simple. The following code will add the roles user, admin, and editor to your model class. You can pass in an array of strings or symbols. You can even pass in a mixed array of strings and symbols.

```ruby
class User < ActiveRecord::Base
  royce_roles %w[ user admin editor ] # array of strings
end

class Sailor < ActiveRecord::Base
  royce_roles [ :captain, :bosun, :quartermaster ] # array of symbols
end

class RockAndRoller < ActiveRecord::Base
  royce_roles [ :drummer, 'bassist', :editor ] # array of strings and symbols
end
```

Now instances of your user class have some roles methods. You can add, remove, query role status, and even ask if an instance can accept such a role.

```ruby
user = User.create()

user.add_role :user
user.add_role 'user'
user.add_role Royce::Role.find_by(name: 'user')

user.remove_role :user
user.remove_role 'user'
user.remove_role Royce::Role.find_by(name: 'user')

user.has_role? :user
user.has_role? 'user'
user.has_role? Royce::Role.find_by(name: 'user')

user.allowed_role? 'user'
user.allowed_role? :user
user.allowed_role? Royce::Role.find_by(name: 'user')
```

You also get some conveneint methods to query if a user has a certain named role.

```ruby
user.admin?
user.editor?
user.user?
```

You can easily add a role to your model object using our bang! methods.

```ruby
user.user!
user.admin!
user.editor!
```

Get a list of roles that a particular user has

```ruby
user.add_role :user
user.add_role :admin
user.role_list # => ['user', 'admin']
```

Get a list of all roles available to a class

```ruby
User.available_role_names # => ['user', 'admin', 'editor']
```

Not enough. You also get named scopes on your models.

```ruby
User.admins
User.editors
User.users
```

If you liked that, you'll LOVE this. We've added the ability to take a role, and return all instances of a class that have that role.

For `User`s it'll look like this:

```ruby
admin_role = Royce::Role.find_by(name: 'admin')
admin_role.users.all # Array of user objects
```

