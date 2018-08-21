class ArtistsController < ApplicationController

  def show
    # Artist Dashboard
    authorize current_user
  end

end
