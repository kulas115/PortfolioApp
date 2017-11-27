# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse condimentum nunc purus, in vehicula erat venenatis non. Nulla facilisi. Vivamus porta turpis non ultricies faucibus. Sed ac tellus ut ex iaculis pulvinar ut ac sem. Proin ornare mauris eu purus hendrerit, luctus commodo ex blandit. Proin at ultrices metus. In et massa arcu. Morbi cursus lobortis neque a interdum. Proin lectus sem, facilisis sit amet tincidunt sit amet, vulputate id arcu. Quisque id ullamcorper ligula. In et tellus vel sapien dignissim pulvinar ut id lorem. Donec dignissim vel eros in laoreet. Praesent in imperdiet turpis. Nam ut tortor vitae odio varius egestas. Donec non nisi est.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skilss created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam hendrerit justo massa, ut sodales sapien laoreet nec. Etiam feugiat dui viverra metus placerat, at dignissim dui mattis. Sed imperdiet nibh eros, sed elementum tortor consequat ac. Cras vestibulum luctus laoreet. Phasellus fermentum, sem eget bibendum consequat, justo neque tincidunt lorem, non ullamcorper magna velit porttitor tortor. Nulla felis elit, tincidunt eget commodo in, porta quis leo. Etiam at ipsum ac nisl accumsan vehicula nec ultrices ipsum" ,
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

puts "8 portfolio items created"

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam hendrerit justo massa, ut sodales sapien laoreet nec. Etiam feugiat dui viverra metus placerat, at dignissim dui mattis. Sed imperdiet nibh eros, sed elementum tortor consequat ac. Cras vestibulum luctus laoreet. Phasellus fermentum, sem eget bibendum consequat, justo neque tincidunt lorem, non ullamcorper magna velit porttitor tortor. Nulla felis elit, tincidunt eget commodo in, porta quis leo. Etiam at ipsum ac nisl accumsan vehicula nec ultrices ipsum" ,
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

puts "1 portfolio item created"
