class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, User, id: user.id
    can :manage, Order, id: user.id
		can :read, Product
    can :manage, :all if user.admin
  end
end
