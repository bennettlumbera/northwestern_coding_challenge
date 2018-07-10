class CreateJoinTableRegistriesCoordinators < ActiveRecord::Migration[5.0]
  def change
    create_join_table :registries, :coordinators do |t|
      # t.index [:registry_id, :coordinator_id]
      # t.index [:coordinator_id, :registry_id]
    end
  end
end
