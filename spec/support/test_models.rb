class User < ActiveRecord::Base
  royce_roles %w[user admin editor]
end

class Employee < ActiveRecord::Base
  royce_roles %w[partier rocker]
end

class BabyBoomer < ActiveRecord::Base
  royce_roles %i[partier rocker]
end
