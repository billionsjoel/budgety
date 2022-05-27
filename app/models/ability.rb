class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Splash
    return unless user.present?

    can :manage, Category, user: user
    can :manage, Purchase, user: user
  end
end
