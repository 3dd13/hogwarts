class SetupStudentBelongsToHouse < ActiveRecord::Migration
  def up
    remove_column :houses, :student_id

    add_column :students, :house_id, :integer
    add_index :students, :house_id
  end

  def down
    add_column :houses, :student_id, :integer

    remove_column :students, :house_id
  end
end
