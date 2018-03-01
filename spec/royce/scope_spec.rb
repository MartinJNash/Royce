require 'spec_helper'

describe 'Testing class-level scopes' do

  before do
    Employee.delete_all
    BabyBoomer.delete_all
    User.delete_all
  end

  it 'Has named scopes' do
    expect(Employee.available_role_names).to eq %w[partier rocker]
  end

  it 'Owner named scopes return owners with role' do
    employee = Employee.create
    expect(Employee.partiers.include?(employee)).to be false
    employee.add_role :partier
    expect(Employee.partiers.include?(employee)).to be true
    expect(Employee.rockers.include?(employee)).to be false
  end

  it 'Named scope updates for tag removal deletion' do
    employee = Employee.create
    employee.add_role :rocker
    expect(Employee.rockers.include?(employee)).to be true
    employee.remove_role :rocker
    expect(Employee.rockers.include?(employee)).to be false
    expect(Employee.rockers.count).to eq 0
  end

  describe 'Role to owning class relationships' do
    the_role = Royce::Role.find_by(name: 'partier')
    count  = 20

    it 'exist for single word models' do
      count.times{ Employee.create.add_role 'partier' }
      expect(the_role.employees.count).to eq count
    end

    it 'exist for two word models' do
      count.times { BabyBoomer.create.add_role 'partier' }
      expect(the_role.baby_boomers.count).to eq count
    end
  end

end
