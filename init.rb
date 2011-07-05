require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting this plugin for RedMine'

Redmine::Plugin.register :redmine_custom_fields_deps do
  name 'Redmine Custom Fields Deps plugin'
  author 'mainframezen'
  description 'Redmine plugin that allows dependant custom fields'
  version '0.0.2'
  url 'https://github.com/mainframezen/redmine_custom_fields_deps'
  author_url 'http://mainframezen.com'
  menu :admin_menu, :customfieldsdeps, 
    { :controller => 'customfieldsdeps', :action => 'list' },
    :caption => :l_custdeps_plural,
    :html => {:class => 'custom_fields'}
end
