class CustomfieldsdepsController < ApplicationController
  unloadable
  layout 'admin'

  before_filter :require_admin

  def index
    list
  end
       
  def list
    @teste = [1,2,3]
  end
  

  def save
     
  end
  
  def new
    
  end
  
end
