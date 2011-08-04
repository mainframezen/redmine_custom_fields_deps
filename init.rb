require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting this plugin for RedMine'

require_dependency 'redmine_custom_fields_deps/hooks'

Redmine::Plugin.register :redmine_custom_fields_deps do
  name 'Redmine Custom Fields Deps plugin'
  author 'mainframezen'
  description 'Redmine plugin that allows dependant custom fields'
  version '1.2.0'
  url 'https://github.com/mainframezen/redmine_custom_fields_deps'
  author_url 'http://mainframezen.com'
  menu :admin_menu, :customfieldsdeps, 
    { :controller => 'customfieldsdeps', :action => 'list' },
    :caption => :l_custdeps_plural,
    :html => {:class => 'custom_fields'}
  project_module :customfieldsdeps do
  	permission :edit_custom_deps, :customfieldsdeps => :project
  end
  menu :project_menu, :customfieldsdeps, { :controller => 'customfieldsdeps', :action => 'project' }, :caption => :l_custdeps_plural, :last=>true, :param => :project_id
end
