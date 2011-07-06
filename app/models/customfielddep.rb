class Customfielddep < ActiveRecord::Base
  unloadable

  belongs_to :custom_fields, :class_name => 'CustomField', :foreign_key => 'custom_master_id'
  
  
end
