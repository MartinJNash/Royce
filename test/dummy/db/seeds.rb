
roles = User.available_roles

30_000.times do
  User.create.add_role roles.sample
end
