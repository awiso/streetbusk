class ArtistsController < ApplicationController

  def show
    # Artist Dashboard
    @performances = current_user.performances
    authorize current_user
    authorize @performances
  end

end
