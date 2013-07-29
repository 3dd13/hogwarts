class CreateHousesTable < ActiveRecord::Migration
  def up
    # TODO wanna do many to many ?
    # TODO missing index
    create_table :houses do |t|
      t.string :name
      t.references :students
    end
  end

  def down
    drop_table :houses
  end
end
