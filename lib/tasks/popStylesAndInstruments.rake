namespace :db do
  desc "Fill database with skills and styles"
  task popSS: :environment do
    up_styles
    up_skills

    puts "Instruments and Styles Populuated"
    puts "Complete"
  end

  task popSkills: :environment do 
    up_skills
    puts "Complete"
  end
  
  task popStyles: :environment do 
    up_styles
    puts "Complete"
  end

  def up_styles
    i = 0
    file = Rails.root.join('lib', 'tasks', 'task_data', 'styles.txt')
    puts "Styles uploading"
    File.open(file, 'r').each do |line|
      i = i + 1
      Style.find_or_create_by_name(line)
      print "\rLine #{i}"
    end
    puts "\nStyles Complete"
  end
  
  def up_skills
    i = 0
    file = Rails.root.join('lib', 'tasks','task_data', 'instruments.txt')
    puts "Instruments uploading"
    File.open(file, 'r').each do |line|
      i = i + 1
      Skill.find_or_create_by_name(line)
      print "\rLine #{i}"
    end
    puts "\nInstruments Complete"
  end
end
