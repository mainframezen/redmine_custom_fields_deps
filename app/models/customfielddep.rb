class Customfielddep < ActiveRecord::Base
  unloadable

  validates_uniqueness_of :custom_master_id, :custom_slave_id


  def yaml(obj=nil)
      read_attribute :yaml
  end

  # Makes possible_values accept a multiline string
  def yaml=(arg)
    if arg.is_a?(Array)
      write_attribute(:yaml, arg.compact.collect(&:strip).select {|v| !v.blank?})
    else
      self.yaml = arg.to_s.split(/[\n\r]+/)
    end
  end


  
end
