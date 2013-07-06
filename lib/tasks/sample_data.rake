namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "wadu",
                         email: "wadu@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    

    mrabs = User.create!(name: "MrAbsolute",
                         email: "abs@gmail.com",
                         password: "absman",
                         password_confirmation: "absman")
    

    Craft.create!(name: "Coder")
    Craft.create!(name: "Chef")

    admin.practices.create!(craft_id: 1)
    mrabs.practices.create!(craft_id: 2)
    # multiple creation
    # 99.times do |n|
    #   name  = Faker::Name.name
    #   email = "example-#{n+1}@railstutorial.org"
    #   password  = "password"
    #   User.create!(name: name,
    #                email: email,
    #                password: password,
    #                password_confirmation: password)
    # end
    #users = User.all
    #users.each {|user| user.practices.create!(craft_id: 1)}
  end
end