class WalkSearch < Lupa::Search

  class Scope

#     def one_mile; end
#     def two_miles; end
#     def five_miles; end
    
#     def walk_location_distance_from_me
#       one_mile   = search_attributes[:one_mile]
#       two_miles  = search_attributes[:two_miles]
#       five_miles = search_attributes[:five_miles]
      
#       if one_mile or two_miles or five_miles
        
#       else
        
#       end
#     end
    
    def today; end
    def this_week; end
    def next_week;end

    def walk_begin_time
      today = search_attributes[:today]
      this_week = search_attributes[:this_week]
      next_week = search_attributes[:next_week]

      if today or this_week or next_week
        scope.where('begin_time <= ? OR begin_time <= ? OR begin_time <= ?', today, this_week, next_week)
      else
        scope.where('begin_time <= ? OR begin_time <= ? OR begin_time <= ? OR begin_time <= ?', Time.now + 1.days, Time.now + 7.days, Time.now + 14.days, Time.now + 365.days)
      end
    end

    def male; end
    def female; end

    def gender
      male   = search_attributes[:male]
      female = search_attributes[:female]

      if male or female
        scope.joins(:pup).where('pups.male_female' => [male, female])
      else
        scope.joins(:pup).where('pups.male_female' => ['m', 'f'])
      end
    end

    def xsml; end
    def sml; end
    def med; end
    def lrg; end

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

    def mellow; end
    def temperate; end
    def energetic; end

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