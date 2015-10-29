class WalkSearch < Lupa::Search
  # Scope class holds all your search methods.
  class Scope

    def today
      scope.where('begin_time <= ?' , Time.now + 1.days)
    end

    def next_week
      scope.where('begin_time <= ?' , Time.now + 7.days)
    end

    def next_month
      scope.where('begin_time <= ?' , Time.now + 30.days)
    end

    def male
      scope.joins(:pup).where('pups.male_female' => 'm')
    end

    def female
      scope.joins(:pup).where('pups.male_female' => 'f')
    end

    def xsml
      scope.joins(:pup).where('pups.size' => '1')
    end

    def sml
      scope.joins(:pup).where('pups.size' => '2')
    end

    def med
      scope.joins(:pup).where('pups.size' => '3')
    end

    def lrg
      scope.joins(:pup).where('pups.size' => '4')
    end

    def mellow
      scope.joins(:pup).where('pups.personality' => 'mellow')
    end

    def temperate
      scope.joins(:pup).where('pups.personality' => 'temperate')
    end

    def energetic
      scope.joins(:pup).where('pups.personality' => 'energetic')
    end

  end
end