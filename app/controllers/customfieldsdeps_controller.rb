class CustomfieldsdepsController < ApplicationController
  require 'yaml'

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

  # save is for saving the record
  def update
        @custdep = Customfielddep.find(params[:id])
	yml = YAML.load(@custdep.yaml)
	master = CustomField.find(@custdep.custom_master_id)
	slave = CustomField.find(@custdep.custom_slave_id)
	master_values = ""
	slave_values = ""
	yml.each_key do |key| 
		master_values = master_values+key+"\n"
		slave_values = slave_values+"\n"+yml[key].join("\n")
	end
	master_values.chomp
	master.possible_values = master_values
	master.save
	slave.possible_values = slave_values
	slave.save
        if request.post? and @custdep.update_attributes(params[:customfielddep])
                flash[:notice] = l(:notice_successful_save)
                redirect_to :action => "list"
        else
                flash[:notice] = l(:notice_unsuccessful_save)
                redirect_to :action => 'edit', :id=> @custdep.id
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
	@custdep.yaml.gsub!(/\r/,"")
	@custdep.yaml.gsub!(/\n+/,"\n")
	@customs = CustomField.find(:all,:conditions=>"type='IssueCustomField'",:order=>"name")
	@custs_h = {}
        @customs.each do |c|
        	@custs_h[c.id] = c.name
        end

  end

end
