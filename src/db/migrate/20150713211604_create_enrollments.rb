class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :course, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.integer :hours
      t.boolean :evaluation

      t.timestamps null: false
    end
  end
end
