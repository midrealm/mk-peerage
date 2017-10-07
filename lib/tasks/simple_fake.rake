namespace :simple_fake do
  task :db_reset => :environment do
    Rake::Task['db:drop'].invoke 
    Rake::Task['db:create'].invoke 
    Rake::Task['db:migrate'].invoke 
  end

  task :groups => :environment do
    Rake::Task['groups'].invoke
  end

  task :people => :environment do
    byrd = User.create do |u|
      u.email = 'byrd@example.com'
      u.password = 'password' 
      u.sca_name = 'William Byrd'
      u.modern_name = 'Billy Birdman'
      u.street = 'Division Street'
      u.city = 'Ann Arbor'
      u.state = 'MI'
      u.zipcode = '48105'
      u.phone = '5556667777'
      u.arms = File.open('lib/assets/fake_data/byrd_coa.jpg')
      u.deceased = false
      u.group = Group.find_by(name: 'Cynnabar')
    end

    Laurel.create do |u|
      u.user_id = byrd.id
      u.active = true
      u.elevation_date = Date.parse('1560-May-10')
      u.elevated_by = 'Elizabeth I'
      u.vigilant = false
      #u.role = 'admin'
      u.specialty_detail = ''
      u.bio = 'I like Music. I am a **Catholic**.'
      u.profile_pic = File.open('lib/assets/fake_data/byrd.png')
    end

  end
  task :all => [:db_reset, :groups, :people]
end
