require 'date'

Performance.destroy_all
Genre.destroy_all
User.destroy_all


puts "generate users"
bob = User.create!(email: "bob@example.com", password: "123456", avatar: "https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjQxZzL1f3cAhUwM-wKHamnCOcQjRx6BAgBEAU&url=http%3A%2F%2Fwww.avatarmovie.com%2F&psig=AOvVaw15JVKmh6KSYuO5vsVhyoWV&ust=1534924507663611", name: "bob", artist: false)
adam = User.create!(email: "adam@sevani.com", password: "123456", avatar: "https://www.google.de/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwi86oWD3f3cAhUpzIUKHbeXCJQQjRx6BAgBEAU&url=https%3A%2F%2Fwww.celebritynetworth.com%2Frichest-celebrities%2Factors%2Fadam-sevani-net-worth%2F&psig=AOvVaw1jb1xwrjHcUIZ9tQ_VWHz1&ust=1534926519106801", name: "Adam", artist: true, artist_name: "Adam Sevani", social_media_links:"https://twitter.com/theadamsevani?lang=en
")
bruce = User.create!(email: "bruce@springsteen.com", password: "123456", avatar: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiWtaOG2P3cAhUuzIUKHdLwB_cQjRx6BAgBEAU&url=https%3A%2F%2Ftvtropes.org%2Fpmwiki%2Fpmwiki.php%2FMusic%2FBruceSpringsteen&psig=AOvVaw0aHZKTkG-HBXoSO9ke06m1&ust=1534925174359829", name: "Bruce Springsteen", artist: true, default_performance_photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiOmcKU2P3cAhUwxIUKHV3uDm4QjRx6BAgBEAU&url=https%3A%2F%2Fwww.nme.com%2Fblogs%2Fnme-blogs%2Fbeginners-guide-bruce-springsteen-2151682&psig=AOvVaw0aHZKTkG-HBXoSO9ke06m1&ust=1534925174359829", artist_name: "Bruce Springsteen")


puts "generate genres"
rock = Genre.create!(name: "Rock", performance_type: "Music")
hiphop = Genre.create!(name: "Hip hop", performance_type: "Music")
Genre.create!(name: "Jazz", performance_type: "Music")
breakdance = Genre.create!(name: "Breakdance", performance_type: "Performance")
Genre.create!(name: "Street Art", performance_type: "Performance")

bob_genres = ArtistGenre.new(user: bob, genre: rock)
adam_genres = ArtistGenre.new(user: adam, genre: breakdance)

puts "generate performances"
bruce_performance = Performance.create!(location: "Kottbusser Damm 95, 10967 Berlin", start_time: DateTime.new(2018,9,8,14,5,6), end_time: DateTime.new(2018,9,8,15,5,6), description: "Hey guys! I'm playing at the corner of Kottsbusser street, come join!", genre: rock, photo: bruce.default_performance_photo, user: bruce)
adam_performance = Performance.create!(location: "10178 Berlin", start_time: DateTime.new(2018,9,8,18,5,6), end_time: DateTime.new(2019,9,8,15,5,6), description: "I'm dancing for a whole year underneath the World Time Clock. Viva la dance!", genre: breakdance, photo: "https://farm8.static.flickr.com/7076/7384070338_899d94847c_b.jpg", user: adam)
