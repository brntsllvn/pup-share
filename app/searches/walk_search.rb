class WalkSearch < Lupa::Search

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
    end

    def female
    end

    def gender
      male   = search_attributes[:male]
      female = search_attributes[:female]

      # any but never neither
      if male or female
        scope.joins(:pup).where('pups.male_female' => [male, female])
      else
        scope.joins(:pup).where('pups.male_female' => ['m', 'f'])
      end
    end

    def xsml
    end

    def sml
    end

    def med
    end

    def lrg
    end

    def size
      xsml = search_attributes[:xsml]
      sml  = search_attributes[:sml]
      med  = search_attributes[:med]
      lrg  = search_attributes[:lrg]

      if xsml or sml or med or lrg
        scope.joins(:pup).where('pups.size' => [xsml, sml, med, lrg])
      else
        scope.joins(:pup).where('pups.size' => ['1', '2', '3', '4'])
      end
    end


    def mellow
    end

    def temperate
    end

    def energetic
    end

    def energy
      mellow = search_attributes[:mellow]
      temperate = search_attributes[:temperate]
      energetic = search_attributes[:energetic]

      if mellow or temperate or energetic
        scope.joins(:pup).where('pups.personality' => [mellow, temperate, energetic])
      else 
        scope.joins(:pup).where('pups.personality' => ['mellow', 'temperate', 'energetic'])
      end
    end

  end

end