class Client < ActiveRecord::Base
using_access_control
has_many :accounts, :dependent => :destroy
validates_associated :accounts
has_many :leases, :dependent => :destroy
validates_associated :leases
has_many :schedule_payments, :through => :leases
validates_associated :schedule_payments
validates :name, :length => {:minimum => 2}
validates :lname, :length => {:minimum => 2}
validates :name, :lname, :address, :phone, :presence  => true
def full_name
"#{name} #{lname}"
end

end
