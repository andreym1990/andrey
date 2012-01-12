class CreateSchedulePayments < ActiveRecord::Migration
  def self.up
    create_table :schedule_payments do |t|
      t.date :date_of_payment
      t.integer :lease_id
      t.integer :account_id
      t.integer :method_of_payment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :schedule_payments
  end
end
