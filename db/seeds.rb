a1 = Address.create(street: '100 Sunshine Road', city: 'Austin', state: 'Texas', zip: '78704')

b1 = Building.create(address_id: a1.id)

unit1 = Unit.create(building_id: b1.id, number: 'A1', max_cars: 2)

u1 = User.new(email: 'britney@email.com', first_name: 'Britney', last_name: 'Lyons')
u1.password = 'testing123'
u1.password_confirmation = "testing123"
u1.save

r1 = Resident.create(user_id: u1.id, unit_id: unit1.id)

c1 = Car.create(model: 'Acura', year: 2007, color: 'red', license: 'XXX')

rc1 = ResidentCar.create(resident_id: r1.id, car_id: c1.id)

s1 = Schedule.create(car_id: c1.id, time: Time.now, is_active: true, is_recurring: true, name: "Schedule 1")
s2 = Schedule.create(car_id: c1.id, time: Time.now + 3*10*10, is_active: true, is_recurring: false, name: "Schedule 2")

d1 = Day.create(name: 'Monday')
d2 = Day.create(name: 'Tuesday')
d3 = Day.create(name: 'Wednesday')
d4 = Day.create(name: 'Thursday')
d5 = Day.create(name: 'Friday')
d6 = Day.create(name: 'Saturday')
d7 = Day.create(name: 'Sunday')

sd1 = ScheduleDay.create(schedule_id: s1.id, day_id: d1.id)
sd2 = ScheduleDay.create(schedule_id: s1.id, day_id: d2.id)

sd3 = ScheduleDay.create(schedule_id: s2.id, day_id: d4.id)
sd4 = ScheduleDay.create(schedule_id: s2.id, day_id: d6.id)

ak1 = ApiKey.create(user_id: u1.id, access_token: SecureRandom.hex)

p1 = Phone.create(number: '6303478805')
up1 = UserPhone.create(phone_id: p1.id, user_id: u1.id)











