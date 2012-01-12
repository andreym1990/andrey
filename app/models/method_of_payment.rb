class MethodOfPayment < ActiveRecord::Base
 has_one :schedule_payment
 validates_associated :schedule_payment
 validates :title, :presence => true
 validates :title, :length => {:in => 3..25}
 validates :title, :uniqueness => true
end
