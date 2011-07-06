class CustomfieldsdepsController < ApplicationController
  unloadable
  layout 'admin'

  before_filter :require_admin

  # index does nothing
  def index
    list
  end
      
  # list is the main entry point and lists all custom deps 
  def list
    @custs = Customfielddep.find(:all,:order=>'name')
    @customs = CustomField.find(:all,:conditions=>"type='IssueCustomField'",:order=>"name")
    @custs_h = {}
	@customs.each do |c|
		@custs_h[c.id] = c.name
	end
  end
  
  # save is for saving the record
  def save
	@custdep = Customfielddep.new(params[:customfielddep])
	if @custdep.name? and @custdep.custom_master_id!=@custdep.custom_slave_id and @custdep.save  
		flash[:notice] = l(:notice_successful_save)
      		redirect_to :action => "list", :id => params[:id]
	else
		flash[:notice] = l(:notice_unsuccessful_save)
		@customs = CustomField.find(:all,:conditions=>"type='IssueCustomField'",:order=>"name")
      		render :action => 'new'
	end
     
  end
  
  # new record being created
  def new
    @custdep = Customfielddep.new
    @customs = CustomField.find(:all,:conditions=>"type='IssueCustomField'",:order=>"name")
  end

  # just delete the damn record
  def destroy
    @custdep = Customfielddep.find(params[:id])
    if @custdep.destroy 
	flash[:notice] = l(:notice_successful_delete)
    else
        flash[:notice] = l(:notice_unsuccessful_save)
    end
    redirect_to :action => "list"
  end

  # edit allows to create/edit the dependency tree
  def edit
	@custdep = Customfielddep.find(params[:id])
	@customs = CustomField.find(:all,:conditions=>"type='IssueCustomField'",:order=>"name")
	@custs_h = {}
        @customs.each do |c|
        	@custs_h[c.id] = c.name
        end

  end
  
end
