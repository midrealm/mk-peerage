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
      u.peer = Peer.create do |p|
        p.active = true
        p.elevation_date = Date.parse('1560-May-10')
        p.elevated_by = 'Elizabeth I'
        p.vigilant = false
        p.specialty_detail = 'Motets'
        p.bio = 'I like Music. I am a **Catholic**.'
        p.profile_pic = File.open('lib/assets/fake_data/byrd.png')
        p.admin = true
      end
    end

    elizabeth = User.create do |u|
      u.email = 'elizabeth@example.com'
      u.password = 'password' 
      u.sca_name = 'Elizabeth I'
      u.modern_name = 'Lizzy Tudor'
      u.deceased = false
      u.royalty = true
      u.street = nil
      u.city = nil
      u.state = nil
      u.zipcode = nil
      u.phone = nil
      u.group = nil
    end
  end
  task :all => [:db_reset, :groups, :people]
end
