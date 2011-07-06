module CustomFieldsDeps
	class Hooks < Redmine::Hook::ViewListener

	render_on :view_issues_form_details_bottom,
               :partial => 'hooks/view_issues_form_details_bottom'
	end
end
