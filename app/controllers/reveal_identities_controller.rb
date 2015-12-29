class RevealIdentitiesController < ApplicationController
   before_filter :authenticate_user!

  def index
  	@reveal_identities = current_user.reveal_identities
  end
end
