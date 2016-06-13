class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
    	can :manage, :all
    else
    	can :read, :all
	    can :manage, User do |edit_user|
	    	edit_user == user
	    end
	    can :manage, Order, id: user.id
			can :read, Product
    end
  end
end
