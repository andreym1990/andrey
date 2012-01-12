class CreatePartitions < ActiveRecord::Migration
  def self.up
    create_table :partitions do |t|
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :partitions
  end
end
