ActiveAdmin.register StaticPage do

	permit_params :help_center, :terms_and_conditions, :privacy_policy, :how_it_work, :facebook_link, :twitter_link, :google_link, :about_us, :contactus

	index do
	     selectable_column
	    column "ID" do |static_page|
	     link_to static_page.id, admin_static_page_path(static_page)
	    end
	    column "terms_and_conditions" do |static_page|
	    	static_page.terms_and_conditions.try(:html_safe)
	    end

	    column "privacy_policy" do |static_page|
	    	image_tag static_page.privacy_policy.try(:html_safe)
	    end

	    column "help_center" do |static_page|
	    	image_tag static_page.help_center.try(:html_safe)
	    end
	 

	    # Adds view/edit/delete actions
	    actions
	  end
	 # show do |f|	 
	 #     f.terms_and_conditions.try(:html_safe)
	 #     f.help_center.try(:html_safe) 
	 # end         

	form do |f|
	   	f.semantic_errors
	    f.inputs 'Details' do 
	      f.input :help_center, :as => :ckeditor
	      f.input :terms_and_conditions, :as => :ckeditor
	      f.input :privacy_policy , :as => :ckeditor
	      f.input :how_it_work, :as => :ckeditor
	      f.input :about_us, :as => :ckeditor
	      f.input :contactus, :as => :ckeditor
	      f.input :facebook_link
	      f.input :twitter_link
	      f.input :google_link

	    end    
	  
	    f.actions
	end
end
