class SchedulePayment < ActiveRecord::Base
belongs_to :lease
validates :lease_id, :presence => true
belongs_to :client
belongs_to :account
validates :account_id, :presence => true
belongs_to :method_of_payment
validates :method_of_payment_id, :presence => true
validate :validate

def client_id
"#{Account.find(account_id).client_id}" 
end

def validate
    if self.account.client_id != self.lease.client_id
     errors.add(:account_id, "Wrong account fot this client")   
    #errors[:base] << "Wrong account fot this client"
    end
  end
end
