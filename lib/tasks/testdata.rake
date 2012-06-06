namespace :db do
  desc "Fill database with test data"
  task populate: :environment do
    styles = %w{ Rock Hip-Hop Jazz Metal Folk Pop Blues
                 Country Electronic Reggae Classical }

    skills = %w{ Drummer Vocalist Guitarist Keyboardist Producer}

    100.times do |i|
      i = i + 1
      puts i
      user = User.new
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.location = "W #{i}th St NY, NY"
      user.styles = styles.sample(Random.rand(1..3)).map {|s| Style.find_or_create_by_name(s) }
      user.skills = skills.sample(Random.rand(1..2)).map {|s| Skill.find_or_create_by_name(s) }
      user.password = "123456"
      user.password_confirmation = "123456"
      user.save
    end
    puts "done"
  end
end
