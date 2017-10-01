# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

["Andheri", "Dadar", "Powai"].each do |a|
    l = Locality.create(:name => a)
    ["Ramesh", "Suresh", "Mahesh"].each do |n|
        DeliveryBoy.create(:locality_id => l.id, :name => n + " " + a)
    end
    ["Sandwich", "Burger", "Pizza"].each_with_index do |f, i|
        food_item = FoodItem.create(:name => i, :price => 50*(i+1))
        food_item.localities << l
    end
end
