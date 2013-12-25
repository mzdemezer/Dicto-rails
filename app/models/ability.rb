class Ability
  include CanCan::Ability

  def initialize user
    alias_action :new, :create, to: :c

    if user.present?
      can :read, WordSet do |word_set| word_set.permits_read_by? user end
      can :c, WordSet
      can :manage, WordSet do |word_set| word_set.permits_write_by? user end
    end
  end
end
