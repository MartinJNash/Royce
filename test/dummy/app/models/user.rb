class User < ActiveRecord::Base
  royce_roles %w[ user admin editor ]
end
