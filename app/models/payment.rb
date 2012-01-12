class Payment < ActiveRecord::Base
belongs_to :account
validates :account_id, :presence => true
belongs_to :schedule_payment
validates :schedule_payment_id, :presence => true
belongs_to :method_of_payment
validates :method_of_payment__id, :presence => true
end
