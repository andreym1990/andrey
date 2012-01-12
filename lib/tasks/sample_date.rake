namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
      10.times do |n|
      name  = Faker::Name.first_name
      sname = Faker::Name.last_name
      lname = Faker::Name.first_name
      address = 'asasadsad'
      phone = Faker::PhoneNumber.phone_number
      Client.create!(:name => name,
                   :sname => sname,
                   :lname => lname,
                   :address => address,
                   :phone => phone)
    end
     Client.all(:limit => 10).each do |client|
      3.times do
        client.accounts.create!(:details => Faker::Lorem.sentence(5))
      end
     Role.create!(:name => 'admin')
     Role.create!(:name => 'guest')
    end
    end
  end
end
