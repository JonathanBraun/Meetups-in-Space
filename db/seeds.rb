# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.create(time: '1pm', duration: '1 hour', name: 'Eammonn\'s birthday party', location: 'A dumpster', date: 'June 19th', description: 'Board games and booze')
User.create(provider: 'comcast', uid: '1', username: 'johnson', email: 'johnson@johnson.com', avatar_url: '/johnson.png')
