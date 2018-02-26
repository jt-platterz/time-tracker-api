class ApplicationPolicy
  module Common
    extend ActiveSupport::Concern

  protected
    
    def authenticated?
      current_user.present?
    end
  end
      
  include ApplicationPolicy::Common

  attr_reader :current_user
  attr_reader :record

  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.exists?(id: record)
  end

  def create?
    false
  end

  def destroy?
    false
  end

  def scope
    scope = record.is_a?(Class) ? record.all : record.class.all
    Pundit.policy_scope!(current_user, scope)
  end

  def permitted_attributes
    []
  end

  class Scope
    include ApplicationPolicy::Common

    attr_reader :current_user
    attr_reader :scope

    def initialize(current_user, scope)
      @current_user = current_user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
