require 'date'

puts 'Remove performances...'
Performance.destroy_all
puts 'Remove genres...'
Genre.destroy_all
puts 'Remove users...'
User.destroy_all

# puts "Generate users"
# User.new(email: 'john@beatles.com', password: '123123', avatar: 'sample', name: 'John Lennon', artist: true, artist_name: 'John', default_performance_photo: 'sample', social_media_links: 'www.twitter.com').save

# User.new(email: 'paul@beatles.com', password: '123123', avatar: 'sample', name: 'Paul McCartney', artist: true, artist_name: 'Paul', default_performance_photo: 'sample', social_media_links: 'www.twitter.com').save

# User.new(email: 'george@beatles.com', password: '123123', avatar: 'sample', name: 'George Harrison', artist: true, artist_name: 'George', default_performance_photo: 'sample', social_media_links: 'www.twitter.com').save

# User.new(email: 'ringo@beatles.com', password: '123123', avatar: 'sample', name: 'Ringo Starr', artist: true, artist_name: 'Ringo', default_performance_photo: 'sample', social_media_links: 'www.twitter.com').save

# john = User.first
# ringo = User.last

# User.new(email: 'fan@beatles.com', avatar: 'sample', name: 'Fan', artist: false).save

# puts "Generate genres"
# Genre.create!(name: "Rock", performance_type: "Music")
# Genre.create!(name: "Hip hop", performance_type: "Music")
# Genre.create!(name: "Breakdance", performance_type: "Performance")
# Genre.create!(name: "Jazz", performance_type: "Music")
# Genre.create!(name: "Street Art", performance_type: "Performance")

# puts "Generate performances"

# johnsPerf = Performance.create(location: 'Berlin', start_time: Date.today, end_time: Date.tomorrow, description: 'asdf', photo: 'ebhatafs9tqo8fycolwg.jpg')
# johnsPerf.user = john
# johnsPerf.genre = Genre.first
# johnsPerf.save!
# p johnsPerf.valid?

# ringosPerf = Performance.create(location: 'London', start_time: Date.today, end_time: Date.tomorrow, description: 'asdf', photo: 'ebhatafs9tqo8fycolwg.jpg')
# ringosPerf.user = ringo
# ringosPerf.genre = Genre.last
# ringosPerf.save!

# puts "Done!"

