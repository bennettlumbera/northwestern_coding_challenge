class AddPasswordToCoordinators < ActiveRecord::Migration[5.0]
  def change
    add_column :coordinators, :password, :string
  end
end
