namespace :fake_data do
  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
  end

  task :groups => :environment do
    Rake::Task['groups'].invoke
  end

  task :people => :environment do
    Specialty.create([{name: 'Music'}, {name: 'Costuming'}, {name: 'Painting'}, {name: 'Calligraphy & Illumination'}])
  
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
      u.deceased = false
      u.active = true
      u.elevation_date = Date.parse('1560-May-10')
      u.elevators = 'Elizabeth I'
      u.vigilant = false
      u.role = 'admin'
      u.laurel = true
      u.specialty_detail = ''
      u.group = Group.find_by(name: 'Cynnabar')
      u.bio = 'I like Music. I am a **Catholic**.'
      u.profile_pic = File.open('lib/assets/fake_data/byrd.png')
      u.arms = File.open('lib/assets/fake_data/byrd_coa.jpg')
    end
  
    Specialization.create(user: byrd, specialty: Specialty.find_by(name: 'Music'))
  
    tallis = User.create do |u|
      u.email = 'tallis@example.com'
      u.password = 'password' 
      u.sca_name = 'Thomas Tallis'
      u.modern_name = 'Tommy Tallman'
      u.street = 'Somewhere'
      u.city = 'Chicago'
      u.state = 'IL'
      u.zipcode = ''
      u.phone = '5556667777'
      u.deceased = true
      u.active = false
      u.elevation_date = Date.parse('1532-Sept-05')
      u.elevators = 'Henry VIII'
      u.vigilant = false
      u.role = 'normal'
      u.laurel = true
      u.specialty_detail = 'Polyphony'
      u.group = Group.find_by(name: 'Tree Girt Sea')
      u.bio = 'I liked Music First.'
      u.profile_pic = File.open('lib/assets/fake_data/tallis.png')
    end
  
    Specialization.create(user: tallis, specialty: Specialty.find_by(name: 'Music'))
    Apprenticeship.create(user: byrd, laurel: tallis)
     
    morley = Candidate.create do |u|
      u.sca_name = 'Thomas Morley'
      u.vote = true
      u.profile_pic = File.open('lib/assets/fake_data/morley.png')
      u.group = Group.find_by(name: 'Northwoods')
    end    
    Specialization.create(candidate: morley, specialty: Specialty.find_by(name: 'Music'))
    Advocacy.create(candidate: morley, user: byrd)
  
    hilliard = User.create do |u|
      u.email = 'hillidard@example.com'
      u.password = 'password' 
      u.sca_name = 'Nicholas Hilliard'
      u.modern_name = 'Nick Hill'
      u.street = 'Somewhere'
      u.city = 'Columbus'
      u.state = 'OH'
      u.zipcode = ''
      u.phone = '5556667777'
      u.deceased = false
      u.active = true
      u.elevation_date = Date.parse('1572-Jan-15')
      u.elevators = 'Elizabeth I'
      u.vigilant = false
      u.role = 'normal'
      u.laurel = true
      u.specialty_detail = 'Portraits'
      u.group = Group.find_by(name: 'Middle Marches')
      u.bio = 'Yay Painting.'
      u.profile_pic = File.open('lib/assets/fake_data/hilliard.png')
    end
    
    Specialization.create(user: hilliard, specialty: Specialty.find_by(name: 'Painting'))
    holbein = User.create do |u|
      u.email = 'holbein@example.com'
      u.password = 'password' 
      u.sca_name = 'Hans Holbein the Younger'
      u.modern_name = 'Henry Holiday'
      u.street = 'Somewhere'
      u.city = 'Columbus'
      u.state = 'OH'
      u.zipcode = ''
      u.phone = '5556667777'
      u.deceased = false
      u.active = true
      u.elevation_date = Date.parse('1572-Jan-15')
      u.elevators = 'Elizabeth I'
      u.vigilant = false
      u.role = 'normal'
      u.laurel = true
      u.specialty_detail = 'Portraits'
      u.group = Group.find_by(name: 'Middle Marches')
      u.bio = 'Yay Painting.'
      u.profile_pic = File.open('lib/assets/fake_data/hans.png')
    end
    
    Specialization.create(user: holbein, specialty: Specialty.find_by(name: 'Painting'))

    oliver = Candidate.create do |u|
      u.sca_name = 'Isaac Oliver'
      u.vote = false
      u.profile_pic = File.open('lib/assets/fake_data/oliver.png')
      u.group = Group.find_by(name: 'Roaring Wastes')
    end    

    Specialization.create(candidate: oliver, specialty: Specialty.find_by(name: 'Painting'))
    Advocacy.create(candidate: oliver, user: hilliard)
    Advocacy.create(candidate: oliver, user: holbein)

    elizabeth = User.create do |u|
      u.email = 'elizabeth@example.com'
      u.password = 'password' 
      u.sca_name = 'Elizabeth I'
      u.modern_name = 'Lizzy Tudor'
      u.street = 'Somewhere'
      u.city = 'Chicago'
      u.state = 'IL'
      u.zipcode = ''
      u.phone = '5556667777'
      u.deceased = false
      u.active = true
      u.elevation_date = nil
      u.elevators = nil
      u.vigilant = false
      u.role = 'normal'
      u.laurel = false
      u.royalty = true
      u.specialty_detail = ''
      u.group = nil
      u.bio = nil
    end

### comments
    Comment.create do |c|
      c.candidate = morley
      c.user = byrd
      c.text = "I don't know why he's so focused on Madrigals. Latin polyphony is what he should be doing. Also, isn't that a picture of John Bull?" 
    end
  end

  task :all => [:db_reset, :groups, :people]
end
