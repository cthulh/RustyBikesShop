class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      # admin can edit everything
      can :manage, :all
    else
      # all users can view products and comments
      can :read, Product
      can [:read, :create], Comment
      # user can edit their own details, orders, comments
      can :manage, User, id: user.id
      can :manage, Order, id: user.id
      can [:edit, :destroy], Comment, id: user.id
    end
  end
end
