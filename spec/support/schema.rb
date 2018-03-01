ActiveRecord::Schema.define do
  self.verbose = false

  create_table :royce_connector, force: true do |t|
    t.integer  :roleable_id,   null: false
    t.string   :roleable_type, null: false
    t.integer  :role_id,       null: false
    t.datetime :created_at
    t.datetime :updated_at
  end

  add_index :royce_connector, [:role_id], name: :index_royce_connector_on_role_id
  add_index :royce_connector, [:roleable_id, :roleable_type], name: :index_royce_connector_on_roleable_id_and_roleable_type

  create_table :royce_role, force: true do |t|
    t.string   :name,       null: false
    t.datetime :created_at
    t.datetime :updated_at
  end

  add_index :royce_role, [:name], name: :index_royce_role_on_name

  create_table :users, force: true do |t|
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :employees, force: true do |t|
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :baby_boomers, force: true do |t|
    t.datetime :created_at
    t.datetime :updated_at
  end
end
