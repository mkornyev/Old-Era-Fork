class Ability
    include CanCan::Ability
  
    def initialize(user)
      # set user to new User if not logged in
      user ||= User.new # i.e., a guest user
  
      # set authorizations for different user roles
      # can :manage, :all
      if user.role? :admin
        # they get to do it all
        can :manage, :all
  
      elsif user.role? :sow
        # can read camps, curriculums, and locations and instructors
        can :read, Resource
        can :read, Flag
        can :read, Transaction
        can :read, Tag
  
        # they can read their own profile
        can :update, User do |u|
          u.id == user.id
        end
  
        # they can update their own profile
        can :update, OutreachWorker do |this_worker|
          user.outreachWorker == this_worker
        end
  
        can :show, OutreachWorker do |this_worker|
          user.outreachWorker == this_worker
        end
  
        # can read a list of students in their camps and can read student details for
        # any student registered for any of their camps (past or upcoming). They
        # can read associated family information for any student they are
        # authorized to view.
        can :show, ReEntrant do |this_entrant|
          my_transactions = user.outreachWorker.transactions
          transactions.each do |t|
            my_reentrants = t.re_entrants.map(&:id)
            contains_entrant = my_reentrants.include? this_entrant.id
          end
          contains_entrant
        end
  
      elsif user.role? :reentrant
        # they can read their own data
        # they can read their own profile
        can :update, User do |u|
          u.id == user.id
        end
  
        # they can update their own profile
        can :update, ReEntrant do |this_reentrant|
          user.reentrant == this_reentrant
        end
  
        can :show, ReEntrant do |this_reentrant|
          user.reentrant == this_reentrant
        end
  
      else
        # guests can only read camp and curriculum details covered (plus home pages)
  
        can :create, ReEntrant
        can :create, User
  
      end
    end
  end
  