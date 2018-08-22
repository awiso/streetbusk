class PerformancePolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    new?
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end
end
