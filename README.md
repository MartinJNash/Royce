Royce
======

Roles in Rails.

## Installation

Add this to your Gemfile.

    gem 'royce'

Run this in your terminal.

    rails g royce:install

Add this to a model.

    royce_roles %w[ owner editor administrator ]


## In Depth

Adding royce to a model is super simple. The following code will add the roles user, admin, and editor to your model class.

```
class User < ActiveRecord::Base
  royce_roles %w[ user admin editor ]
end
```

Now instances of your user class have some roles methods. You can add, remove, query role status, and even ask if an instance can accept such a role.

```
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

```
user.admin?
user.editor?
user.user?
```

Not enough. You also get named scopes on your models.

```
User.admins
User.editors
User.users
```

If you liked that, you'll LOVE this. We've added the ability to take a role, and return all instances of a class that have that role.

For `User`s it'll look like this:

```
admin_role = Royce::Role.find_by(name: 'admin')
admin_role.users.all # Array of user objects
```

