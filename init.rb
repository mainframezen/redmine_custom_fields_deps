require 'redmine'

Redmine::Plugin.register :redmine_custom_fields_deps do
  name 'Redmine Custom Fields Deps plugin'
  author 'mainframezen'
  description 'Redmine plugin that allows dependant custom fields'
  version '0.0.1'
  url 'https://github.com/mainframezen/redmine_custom_fields_deps'
  author_url 'http://mainframezen.com'
  menu :admin_menu, :customfieldsdeps, 
    { :controller => 'customfieldsdeps', :action => 'index' },
    :caption => 'Custom Fields Dependencies',
    :html => {:class => 'custom_fields'}
end
