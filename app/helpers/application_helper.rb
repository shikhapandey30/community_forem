module ApplicationHelper

	def class_container
		(!params[:controller].eql?("devise/sessions") && !params[:controller].eql?("registrations") && !params[:controller].eql?("devise/passwords")) ? params[:action] =="index" ? "mainContner" : "mainCOntnt" : "loginOuter"
	end

	def action_exist?
		params[:action] != "terms_and_conditions" &&  params[:action] != "privacy_policy" &&  params[:action] != "how_it_work"  &&  params[:action] != "contactus" &&  params[:action] != "aboutus" &&  params[:action] != "help"
	end

  def select_type(f, attribute)    
    f.object.send(attribute) ? f.object.send(attribute) : "Select"    
  end


  # def flash(level)
  #       case level
  #       when 'notice' then "alert alert-info"
  #       when 'success' then "alert alert-success"
  #       when 'error' then "alert alert-error"
  #       when 'alert' then "alert alert-error"
  #       end
  #   end

end
