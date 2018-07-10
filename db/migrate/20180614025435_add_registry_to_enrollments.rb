class AddRegistryToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_reference :enrollments, :registry, foreign_key: true
  end
end
