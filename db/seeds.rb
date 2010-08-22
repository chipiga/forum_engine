# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

u = User.create(:username => 'admin', :email => 'admin@email.com', :password => 'admin')
2.times{ u.confirm! }
u.roles << 'admin'
u.save(false)

u = User.create(:username => 'moderator', :email => 'moderator@email.com', :password => 'moderator')
2.times{ u.confirm! }
u.roles << 'moderator'
u.save(false)

u = User.create(:username => 'user', :email => 'user@email.com', :password => 'user')
2.times{ u.confirm! }
