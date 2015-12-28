class RevealIdentitiesController < ApplicationController
  def index
  	@reveal_identities = current_user.reveal_identities
  end
end
