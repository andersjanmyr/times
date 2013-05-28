class Ability
  include CanCan::Ability
  # https://github.com/ryanb/cancan/wiki/Defining-Abilities

  def initialize(user)
    if user && user.admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    end
  end
end
