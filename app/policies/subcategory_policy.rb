class SubcategoryPolicy < ApplicationPolicy
  alias event record

  def show?
    true
  end

  def index?
    true
  end
end
