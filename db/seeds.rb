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
  city_id = 16 + n
  Room.create(
    name: name,
    price: "300000",
    city_id: city_id
  )
end
