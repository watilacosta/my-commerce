# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.admin? && user.active?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
