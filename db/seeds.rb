# Create the address of the first building
a1 = Address.create(street: '100 Sunshine Road', city: 'Austin', state: 'Texas', zip: '78704')

# Create the building and associated garage
b1 = Building.create(address_id: a1.id)
g1 = Garage.create(address_id: a1.id, name: 'Garage 1')
bg1 = BuildingGarage.create(building_id: b1.id, garage_id: g1.id, email: 'garageEmail@email.com')
p1 = Phone.create(number: '1234567890')
bgp1 = BuildingGaragesPhone.create(phone_id: p1.id, building_garage_id: bg1.id)

# Create the first unit
unit1 = Unit.create(building_id: b1.id, number: 'A1', max_cars: 2)

# Create the first user as a resident
u1 = User.new(email: 'britney@email.com', first_name: 'Britney', last_name: 'Lyons')
u1.password = 'testing123'
u1.password_confirmation = "testing123"
u1.save
p2 = Phone.create(number: '6303478805')
up1 = UserPhone.create(phone_id: p2.id, user_id: u1.id)

r1 = Resident.create(user_id: u1.id, unit_id: unit1.id)

s1 = Status.create(id: 1, name: 'Requested for Pickup')
s2 = Status.create(id: 2, name: 'Being Retrieved')
s3 = Status.create(id: 3, name: 'Parked in Garage')
s4 = Status.create(id: 4, name: 'In Use by Resident')

# Add cars to the first resident
c1 = Car.create(model: 'Acura', year: 2007, color: 'red', license: 'XXX', status_id: s3.id)
rc1 = ResidentCar.create(resident_id: r1.id, car_id: c1.id)

# Define the days of the week
d1 = Day.create(name: 'Monday')
d2 = Day.create(name: 'Tuesday')
d3 = Day.create(name: 'Wednesday')
d4 = Day.create(name: 'Thursday')
d5 = Day.create(name: 'Friday')
d6 = Day.create(name: 'Saturday')
d7 = Day.create(name: 'Sunday')

# Add schedules to the first resident's car
s1 = Schedule.create(car_id: c1.id, time: Time.now, is_active: true, is_recurring: true, name: "Schedule 1")
s2 = Schedule.create(car_id: c1.id, time: Time.now + 3*10*10, is_active: true, is_recurring: false, name: "Schedule 2")

sd1 = ScheduleDay.create(schedule_id: s1.id, day_id: d1.id)
sd2 = ScheduleDay.create(schedule_id: s1.id, day_id: d2.id)

sd3 = ScheduleDay.create(schedule_id: s2.id, day_id: d4.id)
sd4 = ScheduleDay.create(schedule_id: s2.id, day_id: d6.id)

# Create the api key for the user
ak1 = ApiKey.create(user_id: u1.id, access_token: SecureRandom.hex)













