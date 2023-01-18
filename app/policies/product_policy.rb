# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def index?
    active_admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
