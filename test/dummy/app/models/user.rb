class User < ActiveRecord::Base
  royce_roles :user, :admin, :editor
end
