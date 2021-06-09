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

5.times do |n|
  name = "Room-#{n+1}"
  fist_city = City.find_by(name: "Hồ Chí Minh")
  city_id = fist_city.id + n
  Room.create!(
    name: name,
    price: "300000",
    description: "Phong dep",
    city_id: city_id
  )
end
