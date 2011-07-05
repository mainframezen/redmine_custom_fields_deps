class CustomfieldsdepsController < ApplicationController
  unloadable
  layout 'admin'

  before_filter :require_admin

  def index
    list
  end
       
  def list
    @custs = Customfielddep.find(:all,:order=>'name')
  end
  

  def save
     
  end
  
  def new
    
  end
  
end
