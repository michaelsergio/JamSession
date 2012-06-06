namespace :db do
  desc "Fill database with skills and styles"
  task popSS: :environment do
    up_styles
    up_skills
  end

  task popSkills: :environment do 
    up_skills
  end
  
  task popStyles: :environment do 
    up_styles
  end

  def up_styles
    i = 0
    file = Rails.root.join('lib', 'tasks', 'task_data', 'styles.txt')
    puts "Styles uploading"
    File.open(file, 'r').each do |line|
      i = i + 1
      Style.find_or_create_by_name(line)
      print "Line #{i}"
    end
    puts "Styles Complete"

    puts "Instruments and Styles Populuated"
  end
  
  def up_skills
    i = 0
    file = Rails.root.join('lib', 'tasks','task_data', 'instruments.txt')
    puts "Instruments uploading"
    File.open(file, 'r').each do |line|
      i = i + 1
      Skill.find_or_create_by_name(line)
      print "Line #{i}"
    end
    puts "Instruments Complete"
  end
end
