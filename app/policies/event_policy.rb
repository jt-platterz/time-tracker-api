class EventPolicy < ApplicationPolicy
  alias event record

  def show?
    authenticated?# event.user_id === current_user&.id
  end

  def index?
    authenticated?
  end

  def create?
    authenticated?
  end

  def update?
    authenticated?# event.user_id === current_user&.id
  end

  def destroy?
    authenticated?# event.user_id === current_user&.id
  end

  # class Scope < Scope
  #   def resolve
  #     scope.where(user_id: current_user.id)
  #   end
  # end
end
