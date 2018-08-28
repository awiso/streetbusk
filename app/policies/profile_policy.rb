class ProfilePolicy < ApplicationPolicy
  def edit?
    true
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
