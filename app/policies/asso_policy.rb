class AssoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def delete?
    user.admin?
  end
end
