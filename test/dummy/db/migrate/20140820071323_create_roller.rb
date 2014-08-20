class CreateRoller < ActiveRecord::Migration

  def change

    create_table :roller_connector do |t|
      t.references :roleable, polymorphic: true, null: false
      t.references :role, null: false
    end

    add_index :roller_connector, [:roleable_id, :roleable_type]
    add_index :roller_connector, :role_id

    create_table :roller_role do |t|
      t.string :type
      t.string :name, null: false
      t.timestamps
    end

    add_index :roller_role, :name

  end
end
