ActiveAdmin.register StaticPage do



if StaticPage.count>0
 config.clear_action_items!
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :help_center, :terms_and_conditions, :privacy_policy, :how_it_work, :facebook_link,:twitter_link,:google_link,:about_us
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
