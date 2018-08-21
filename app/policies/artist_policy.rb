class ArtistPolicy < ApplicationPolicy

  def show?
    user.artist
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
