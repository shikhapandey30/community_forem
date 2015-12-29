class RevealIdentitiesController < ApplicationController
  def index
  	@reveal_identities = current_user.reveal_identities.order("created_at desc") rescue []
  end
end
