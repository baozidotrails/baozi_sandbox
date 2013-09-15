namespace :db do
  desc "將 Sample Data 填入 Database"
  task populate: :environment do
    admin = User.create!(name: "Baozi Wu ",
                 email: "baozi.rails@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end