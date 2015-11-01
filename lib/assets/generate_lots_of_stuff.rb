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
  "Space Needle, 400 Broad Street, Seattle, WA 98109"
  ]

20.times do 
  Location.create(full_street_address: seattle_addresses.sample, owner: User.all.sample)
end

# generate walks

100.times do 
  Walk.create( begin_time: Faker::Time.forward(400), duration: rand(75), owner: User.all.sample, pup: Pup.all.sample, location: Location.all.sample, phone_number: PhoneNumber.all.sample)
end