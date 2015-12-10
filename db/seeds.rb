speakers = Speaker.create([{first_name: 'Freddie', last_name: 'Mercury'}, {first_name: 'Brian', last_name: 'May'}, {first_name: 'John', last_name: 'Deacon'}])
talks    = Talk.create([{title: 'Another One Bites the Dust', speaker: Speaker.first}, {title: 'I Want to Break Free', speaker: Speaker.find_by(first_name: 'Brian')}, {title: "You're My Best Friend", speaker: Speaker.last}])
venue    = Venue.create(name: 'Renew Financial', address_1: '400 SW 6th Ave.')
meetings = Meeting.create([{date: Date.yesterday, venue: Venue.first}, {date: Date.tomorrow, venue: Venue.first}])