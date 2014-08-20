require 'test_helper'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
ActiveRecord::Migration.create_table :employees
ActiveRecord::Migration.create_table :baby_boomers
load "dummy/db/schema.rb"
ActiveRecord::Migrator.up "db/migrate"

def human_roles
   %w( partier rocker )
end

class Employee < ActiveRecord::Base
  roller_roles human_roles
end

class BabyBoomer < ActiveRecord::Base
  roller_roles human_roles
end

describe "Testing class-level scopes" do

  before do
    Employee.delete_all
    BabyBoomer.delete_all
    User.delete_all
  end

  it "Has named scopes" do
    Employee.available_role_names.must_equal human_roles
  end

  it "Owner named scopes return owners with role" do
    employee = Employee.create
    Employee.partiers.include?(employee).must_equal false
    employee.add_role :partier
    Employee.partiers.include?(employee).must_equal true
    Employee.rockers.include?(employee).must_equal false
  end

  it "Named scope updates for tag removal deletion" do
    employee = Employee.create
    employee.add_role :rocker
    Employee.rockers.include?(employee).must_equal true
    employee.remove_role :rocker
    Employee.rockers.include?(employee).must_equal false
    Employee.rockers.count.must_equal 0
  end


  describe "Role to owning class relationships" do

    the_role = Roller::Role.find_by(name: 'partier')
    count  = 20

    it "exist for single word models" do
      count.times{ Employee.create.add_role 'partier' }
      the_role.employees.count.must_equal count
    end

    it "exist for two word models" do
      count.times { BabyBoomer.create.add_role 'partier' }
      the_role.baby_boomers.count.must_equal count
    end

  end



end
