# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
@library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
@library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
@guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
@guest2 = Guest.create!(name:"Chelsea", age:23, new:true, library_id:@library2.id)
