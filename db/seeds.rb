City.create(
  name: "Hồ Chí Minh"
)
City.create(
  name: "Vũng Tàu"
)
City.create(
  name: "Hà Nội"
)
City.create(
  name: "Đà Nẵng"
)
City.create(
  name: "Đà Lạt"
)

User.create!(
  first_name: "Truong Viet",
  last_name: "Bach",
  email: "tvbach@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  role: 1
)

5.times do |n|
  name = "Room-#{n+1}"
  fist_city = City.find_by(name: "Hồ Chí Minh")
  city_id = fist_city.id + n
  user_id = User.find_by email: "tvbach@gmail.com"
  Room.create!(
    name: name,
    price: "300000",
    description: "Phong dep",
    city_id: city_id,
    user_id: user_id.id,
    capacity_adult_person: 10,
    capacity_child_person: 4
  )
end
