class User < ActiveRecord::Base
  roller_roles %w[ user admin editor ]
end
