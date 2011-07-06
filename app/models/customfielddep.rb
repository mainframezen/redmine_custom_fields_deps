class Customfielddep < ActiveRecord::Base
  unloadable

  validates_uniqueness_of :custom_master_id, :custom_slave_id

  
  
end
