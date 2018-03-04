class EventPolicy < ApplicationPolicy
  alias event record

  def show?
    authenticated? && event.user_id === current_user&.id
  end

  def index?
    authenticated? && event.user_id === current_user&.id
  end

  def create?
    authenticated? && event.user_id === current_user&.id
  end

  def update?
    authenticated? && event.user_id === current_user&.id
  end

  def destroy?
    authenticated? && event.user_id === current_user&.id
  end

  # class Scope < Scope
  #   def resolve
  #     scope.where(user_id: current_user.id)
  #   end
  # end
end
