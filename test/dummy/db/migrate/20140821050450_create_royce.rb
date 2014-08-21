class CreateRoyce < ActiveRecord::Migration

  def change

    create_table :royce_connector do |t|
      t.references :roleable, polymorphic: true, null: false
      t.references :role, null: false
      t.timestamps
    end

    add_index :royce_connector, [:roleable_id, :roleable_type]
    add_index :royce_connector, :role_id

    create_table :royce_role do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :royce_role, :name

  end
end
