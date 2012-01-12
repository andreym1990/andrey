class CreateLeases < ActiveRecord::Migration
  def self.up
    create_table :leases do |t|
      t.date :begin_time
      t.date :end_time
      t.integer :client_id
      t.integer :partition_id

      t.timestamps
    end
  end

  def self.down
    drop_table :leases
  end
end
