class Lease < ActiveRecord::Base
has_many :schedule_payments, :dependent => :destroy
validates_associated :schedule_payments
belongs_to :partition
validates :partition_id, :presence => true
validates :partition_id, :uniqueness => true
belongs_to :client
validates :client_id, :presence => true
validates_date :end_time, :after => :begin_time, 
                          :after_message => 'must be after begin time'

def from_to
"from #{begin_time} to #{end_time} partition #{Partition.find(partition_id).description} "
end
  
end
