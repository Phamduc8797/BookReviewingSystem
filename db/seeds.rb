User.create! name:  "Admin_system",
  email: "adminsystem@gmail.com",
  address: "Handico_OE9_R",
  password: "111111",
  password_confirmation: "111111",
  admin: true,
  activated: true,
  activated_at: Time.zone.now

User.create! name:  "Admin_system1",
  email: "adminsystem1@gmail.com",
  address: "Handico_OE9_R1",
  password: "111111",
  password_confirmation: "111111",
  admin: true,
  activated: true,
  activated_at: Time.zone.now

30.times do |n|
  name = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  address = "address-#{n+1}"
  User.create! name: name,
    email: email,
    address: address,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
end
