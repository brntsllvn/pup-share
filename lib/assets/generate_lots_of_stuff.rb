# run this in the console

# generate pups

100.times do 
  Pup.create(name: Faker::Name.first_name, breed: 'Labrador', male_female: ['m','f'].sample, 
    owner: User.all.sample, age: rand(15), size: ['1','2','3','4'].sample, personality: ['mellow', 'temperate', 'energetic'].sample)
end

# generate Seattle locations
seattle_addresses = [
  "1167 Republican St, Seattle, WA 98109",
  "400 Westlake Ave N, Seattle, WA 98109",
  "1002 Valley St, Seattle, WA 98109",
  "Volunteer Park Water Tower, 1247 15th Ave E, Seattle, WA 98102",
  "901-1099 E Denny Way, Seattle, WA 98122",
  "307 Fairview Ave N, Seattle, WA 98109",
  "Space Needle, 400 Broad Street, Seattle, WA 98109",
  "9996 Mulberry Lane Adrian, MI 49221",
  "6378 Lake Street Horn Lake, MS 38637",
  "4789 Woodland Road District Heights, MD 20747",
  "6571 Cherry Street Ephrata, PA 17522",
  "5967 James Street Mechanicsville, VA 23111",
  "7234 Elm Avenue Windsor, CT 06095",
  "461 Union Street West Hempstead, NY 11552",
  "188 Cleveland Avenue Dawsonville, GA 30534",
  "170 East Avenue Port Huron, MI 48060",
  "638 Wall Street New Milford, CT 06776",
  "463 Route 5 Goshen, IN 46526",
  "74 Hawthorne Lane Cornelius, NC 28031"
  ]

20.times do 
  Location.create(full_street_address: seattle_addresses.sample, owner: User.all.sample)
end

# generate walks

100.times do 
  Walk.create( begin_time: Faker::Time.forward(400), duration: rand(75), owner: User.all.sample, pup: Pup.all.sample, location: Location.all.sample, phone_number: PhoneNumber.all.sample)
end

# generate offers

1000.times do
  Offer.create(walk: Walk.all.sample, walker: User.all.sample)
end