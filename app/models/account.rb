class Account < ActiveRecord::Base
 belongs_to :client
 validates :client_id, :presence =>true
 has_one :schedule_payment
 validates_associated :schedule_payment
 validates :details, :length => {:in => 6..100}
end
