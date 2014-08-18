class CreateRoller < ActiveRecord::Migration

  def change

    create_table :roller_role do |t|
      t.string :name
      t.references :rolleable, polymorphic: true
      t.timestamps
    end

  end
end
