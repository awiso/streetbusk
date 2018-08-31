# require 'date'

puts 'Remove performances...'
Performance.destroy_all
puts 'Remove genres...'
Genre.destroy_all
puts 'Remove users (and artists)...'
User.destroy_all
puts 'Remove attendances...'
Attendance.destroy_all

puts "Generate users"

names = %w(AlexD AlexW Camille Chris Clara Constantin Diego Emily FabianB FabianK Gabriel Ginny Hien Iain Ileana JanC JanS Jascha Jinyong Julian Louis Malcom Matt Matti Max Mike Nicolas Noah Oriane Pascal Pierre Stephane Steven Taylor Umberto Zuza)

names.each do |name|
  new_user = User.new()
  new_user.email = "#{name.downcase}@streetbusk.com"
  new_user.password = '123123'
  new_user.avatar = Rails.root.join("app/assets/images/faces/#{name}.png").open
  new_user.name = name
  new_user.artist = false
  new_user.save!
end

puts "there are now #{User.count} users!"

puts "Generate artists"

artist_names = %w(Alice ClaraM Dimitri Sandrine Bryan Phillip Rich Arbi Martin Andy Flora)
aliases = ['Alice Clavel','Clara Morgen','Dimitri Bosch','Sandeine Aryal','Bryan David','Phillip vHS','Rich O.G.','Arby, man of the Party','Martin D F','Andy Baranov','Flora Pup']

videos = ['https://www.youtube.com/embed/HxJhYpTIrl8']
songs = ['https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/37032471&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"']
artist_names.each_with_index do |name, i|
  new_artist = User.new()
  new_artist.email = "#{name.downcase}@streetbusk.com"
  new_artist.password = '123123'
  new_artist.avatar = Rails.root.join("app/assets/images/artists/#{name}.png").open  
  new_artist.name = name
  new_artist.artist = true
  new_artist.artist_name = aliases[i]
  new_artist.default_performance_photo = "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-0.3.5&s=264727722bf2479d73380e1170bb3f48&auto=format&fit=crop&w=1050&q=80"
  new_artist.soundcloud = songs[0]
  new_artist.youtube = videos[0]
  new_artist.social_media_links = 'www.youtube.com$%$www.instagram.com$%$www.twitter.com$%$www.facebook.com'
  new_artist.save!
end

puts "Generate genres"

Genre.create!(name: "Rock", performance_type: "Music")
Genre.create!(name: "Hip hop", performance_type: "Music")
Genre.create!(name: "Breakdance", performance_type: "Performance")
Genre.create!(name: "Jazz", performance_type: "Music")
Genre.create!(name: "Street Art", performance_type: "Performance")
Genre.create!(name: "Soul", performance_type: "Music")
Genre.create!(name: "Acoustic", performance_type: "Music")
Genre.create!(name: "Magic", performance_type: "Performance")
Genre.create!(name: "Dance", performance_type: "Performance")
Genre.create!(name: "Breakbeat", performance_type: "Music")
Genre.create!(name: "Comedy", performance_type: "Music")
Genre.create!(name: "Uncategorizable", performance_type: "Music")

puts "Generate performances"

places = ['Prenzlauerberg, Berlin', 'Mauerpark', 'Bernauer Strasse, Berlin', 'Falkplatz', 'Alexanderplatz, Berlin', 'Strelitzer Str. 50, Berlin', 'Kreuzberg, Berlin', 'Checkpoint Charlie', 'Deutscher Dom', 'Brandenburger Tor', 'Factory Berlin']
genres = Genre.all.to_a

count = 0
places.each do |place|
  new_performance = Performance.new()
  new_performance.user = User.where(name: artist_names[count]).first
  new_performance.location = place
  new_performance.start_time = DateTime.now
  new_performance.end_time = DateTime.tomorrow
  new_performance.description = "Come to #{place.split(',').first} to watch! 😁"
  new_performance.genre = genres[count]
  new_performance.photo = Rails.root.join("app/assets/images/performances/#{count}.jpg").open  
  new_performance.save!
  count += 1
end

puts "Generate extra performances"

artist_names.each do |artist|
  count = 6
  2.times do
    perf = Performance.new()
    perf.user = User.where(name: artist).first
    perf.location = nil
    perf.start_time = DateTime.now
    perf.end_time = DateTime.tomorrow
    perf.description = 'xyz'
    perf.genre = genres[0]
    perf.photo = Rails.root.join("app/assets/images/performances/#{count}.jpg").open
    perf.save!
    count += 1
  end
end

puts "Generate attendances"

fans = User.all.where(artist: false).where.not(email: 'alexw@streetbusk.com').shuffle

comments = ['Super cool show!', 'Wow so cool! 😱', 'Amazing performance guys - thank you 😘', 'So sick!', 'Take my money!!', 'Pls marry me!!', 'I love your performance', 'Meh', 'O M G !!', '❤️', 'I wanna have yo babies 😍', 'you are truly gifted my friend!', 'hey call me sometime 😉', 'are you guys going on tour soon?', 'u rock 🤘', 'eyyyy bb u got skills']


Performance.all.where.not('performances.location' => nil).to_a.each do |perf|
  3.times do 
    person = fans.pop
    com = Comment.new()
    com.user = person
    com.performance = perf
    com.comment_text = comments.sample
    com.save!
    att = Attendance.new()
    att.user = person
    att.performance = perf
    att.save!
  end
end

puts "Done!"