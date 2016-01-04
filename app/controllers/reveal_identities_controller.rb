class RevealIdentitiesController < ApplicationController

	# filters
  before_filter :authenticate_user!

  # user reveal identity
  def index
  	@reveal_identities = current_user.reveal_identities.order("created_at desc") rescue []
  end
end
