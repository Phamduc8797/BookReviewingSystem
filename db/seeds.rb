User.create! name:  "Example User",
  email: "example@railstutorial.org",
  address: "Xuan Thuy - Cau Giay",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  activated: true,
  activated_at: Time.zone.now

30.times do |n|
  name  = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  address = "address-#{n+1}"
  User.create! name:  name, email: email, address: address, password: password,
    password_confirmation: password, activated: true,
    activated_at: Time.zone.now
end
