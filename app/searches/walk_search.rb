class WalkSearch < Lupa::Search
  # Scope class holds all your search methods.
  class Scope

    # Search method
    def next_week
      scope.where('begin_time <= ?' , Time.now + 7.days)
    end
    
    def next_month
      scope.where('begin_time <= ?' , Time.now + 30.days)
    end

  end
end