class CreateMethodOfPayments < ActiveRecord::Migration
  def self.up
    create_table :method_of_payments do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :method_of_payments
  end
end
