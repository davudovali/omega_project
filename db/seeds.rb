# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.destroy_all

  2.times {FactoryGirl.create :user}

  6.times {FactoryGirl.create :wallet}

  6.times {FactoryGirl.create :expense}

  30.times {FactoryGirl.create :transaction}

