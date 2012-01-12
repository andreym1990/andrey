class Partition < ActiveRecord::Base
has_one :lease
validates_associated :lease
validates :description, :presence => true
validates :description, :length => {:minimum => 5}
end
