class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.string :date_of_enrollment
      t.string :method_of_contact
      t.text :remarks
      t.references :participant, foreign_key: true
      t.references :coordinator, foreign_key: true

      t.timestamps
    end
  end
end
