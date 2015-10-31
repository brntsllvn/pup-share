# run this in the console

# generate pups

100.times do 
Pup.create(name: Faker::Name.first_name, breed: 'Labrador', male_female: ['m','f'].sample, 
  owner: User.all.sample, age: rand(15), size: ['1','2','3','4'].sample, personality: ['mellow', 'temperate', 'energetic'].sample)
end

# generate walks

100.times do 
Walk.create( begin_time: Faker::Time.forward(400), duration: rand(75), owner: User.all.sample, pup: Pup.all.sample, location: Location.all.sample, phone_number: PhoneNumber.all.sample)
end