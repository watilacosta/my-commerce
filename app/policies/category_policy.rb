class CategoryPolicy < ApplicationPolicy
  def index?
    active_admin?
  end

  def create?
    active_admin?
  end

  def update?
    active_admin?
  end

  def active_admin?
    user.admin? && user.active?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
