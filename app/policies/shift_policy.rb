class ShiftPolicy < ApplicationPolicy

  attr_reader :user, :shift

  def initialize(user, shift)
    @user = user
    @shift = shift
  end

  def index?
    false
  end

  def show?
    false
  end
  
  def create?
    new?
  end

  def new?
    return true if @shift.user == @user
    false
  end

  def update?
    return true if @shift.user == @user
    false
  end

  def edit?
    update?
  end

  def destroy?
    return true if @shift.user == @user
    false
  end

  def permitted_attributes
    []
  end

  class Scope < Scope

    def resolve
      scope.all
    end
  end
end
