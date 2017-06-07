namespace :fake_data do
  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
  end

  task :groups => :environment do
    Rake::Task['groups'].invoke
  end

  task :calc_poll => :environment do
    Rake::Task['calculate_poll_results'].invoke
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
    dowland = User.create do |u|
      u.email = 'dowland@example.com'
      u.password = 'password' 
      u.sca_name = 'John Dowland'
      u.modern_name = 'Jonny Dowland'
      u.street = 'Somewhere'
      u.city = 'Bloomington'
      u.state = 'Indiana'
      u.zipcode = ''
      u.phone = '5556667777'
      u.deceased = false
      u.active = false
      u.elevation_date = Date.parse('1570-Sept-05')
      u.elevators = 'Elizabeth I'
      u.vigilant = false
      u.role = 'normal'
      u.laurel = true
      u.specialty_detail = 'Lute Songs'
      u.group = Group.find_by(name: 'Mynydd Seren')
      u.bio = 'I am on of the first Singer Songwriters. No longer active because I moved to Paris.'
      u.profile_pic = File.open('lib/assets/fake_data/dowland.png')
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
      u.email = 'hilliard@example.com'
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
    Image.create(candidate:oliver, image: File.open('lib/assets/fake_data/oliver_1.jpg'))
    Image.create(candidate:oliver, image: File.open('lib/assets/fake_data/oliver_2.jpg'))

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
    Comment.create do |c|
      c.candidate = morley
      c.user = hilliard
      c.text = "I love his music. It's so full of feelings. Great for Beginners!" 
    end
    Comment.create do |c|
      c.candidate = morley
      c.user = holbein
      c.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus semper nunc. Sed ligula quam, euismod at arcu vitae, fermentum dictum felis. Nunc porta ex et eros hendrerit lacinia. In mattis nunc at felis aliquet, vitae varius leo mollis. Aenean congue sagittis rutrum. Aliquam mattis orci ac ornare porta. Integer mollis ullamcorper justo, ut fermentum neque volutpat eu. Cras viverra ex ut libero gravida tincidunt id in leo. Nulla mattis sollicitudin diam eget commodo. Nam dui odio, volutpat sed erat a, tempus maximus diam. Nunc dictum enim vitae dolor venenatis, vitae vulputate orci sodales. In hac habitasse platea dictumst. Aliquam erat volutpat. Quisque gravida sem et eros accumsan ultricies. Morbi ante tellus, semper at commodo sit amet, pharetra vitae mauris. Nulla at viverra mi, vel congue ex.

In eget erat vestibulum, placerat nunc ut, dapibus enim. Sed non sem nec velit mollis iaculis. Ut rhoncus finibus felis, ac interdum quam accumsan ac. Praesent nunc nisl, tempus quis pretium sed, semper in diam. Curabitur id imperdiet ligula. Fusce non felis dolor. Phasellus auctor est mi, eget dignissim sem ullamcorper nec. Nam purus orci, hendrerit non iaculis vel, posuere molestie eros. Fusce posuere efficitur neque, eget varius justo sodales at.

Nunc vehicula purus elementum, volutpat mauris ac, imperdiet ante. Pellentesque pretium ut erat sed egestas. Nulla facilisi. Aliquam ac cursus elit, pharetra cursus justo. Donec facilisis egestas eros facilisis vestibulum. Suspendisse nec tristique quam. Vivamus metus ante, condimentum non viverra ac, mollis nec diam.

Mauris iaculis lectus lacinia ex porta, a ullamcorper enim auctor. Duis tempus tincidunt arcu sed blandit. In sed sodales augue, vitae pretium neque. Pellentesque nec dapibus felis. Fusce lacinia nibh purus, venenatis blandit nunc ullamcorper ut. Etiam sed blandit massa. Sed condimentum cursus mollis. Vestibulum nec felis non ante tempus sollicitudin. Etiam sollicitudin urna vitae lacinia aliquet. Mauris imperdiet quam hendrerit libero tincidunt, et condimentum odio convallis. Aliquam erat volutpat. Proin urna justo, sodales faucibus auctor sed, sodales et risus.

Proin sit amet turpis nec velit euismod sodales at non libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam eu congue ligula. Aenean tincidunt mauris eros, facilisis malesuada leo vulputate eu. Aliquam viverra sollicitudin turpis." 
    end
  
    Comment.create do |c|
      c.candidate = oliver
      c.user = hilliard
      c.text = "He's getting better! He's teaching at RUM" 
    end
    Comment.create do |c|
      c.candidate = oliver
      c.user = byrd
      c.text = "I took his class on portraiture. He's a good teacher. I think he's ready for the vote list." 
    end
    Comment.create do |c|
      c.candidate = oliver
      c.user = holbein
      c.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus semper nunc. Sed ligula quam, euismod at arcu vitae, fermentum dictum felis. Nunc porta ex et eros hendrerit lacinia. In mattis nunc at felis aliquet, vitae varius leo mollis. Aenean congue sagittis rutrum. Aliquam mattis orci ac ornare porta. Integer mollis ullamcorper justo, ut fermentum neque volutpat eu. Cras viverra ex ut libero gravida tincidunt id in leo. Nulla mattis sollicitudin diam eget commodo. Nam dui odio, volutpat sed erat a, tempus maximus diam. Nunc dictum enim vitae dolor venenatis, vitae vulputate orci sodales. In hac habitasse platea dictumst. Aliquam erat volutpat. Quisque gravida sem et eros accumsan ultricies. Morbi ante tellus, semper at commodo sit amet, pharetra vitae mauris. Nulla at viverra mi, vel congue ex.

In eget erat vestibulum, placerat nunc ut, dapibus enim. Sed non sem nec velit mollis iaculis. Ut rhoncus finibus felis, ac interdum quam accumsan ac. Praesent nunc nisl, tempus quis pretium sed, semper in diam. Curabitur id imperdiet ligula. Fusce non felis dolor. Phasellus auctor est mi, eget dignissim sem ullamcorper nec. Nam purus orci, hendrerit non iaculis vel, posuere molestie eros. Fusce posuere efficitur neque, eget varius justo sodales at.

Nunc vehicula purus elementum, volutpat mauris ac, imperdiet ante. Pellentesque pretium ut erat sed egestas. Nulla facilisi. Aliquam ac cursus elit, pharetra cursus justo. Donec facilisis egestas eros facilisis vestibulum. Suspendisse nec tristique quam. Vivamus metus ante, condimentum non viverra ac, mollis nec diam.

Mauris iaculis lectus lacinia ex porta, a ullamcorper enim auctor. Duis tempus tincidunt arcu sed blandit. In sed sodales augue, vitae pretium neque. Pellentesque nec dapibus felis. Fusce lacinia nibh purus, venenatis blandit nunc ullamcorper ut. Etiam sed blandit massa. Sed condimentum cursus mollis. Vestibulum nec felis non ante tempus sollicitudin. Etiam sollicitudin urna vitae lacinia aliquet. Mauris imperdiet quam hendrerit libero tincidunt, et condimentum odio convallis. Aliquam erat volutpat. Proin urna justo, sodales faucibus auctor sed, sodales et risus.

Proin sit amet turpis nec velit euismod sodales at non libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam eu congue ligula. Aenean tincidunt mauris eros, facilisis malesuada leo vulputate eu. Aliquam viverra sollicitudin turpis." 
    end
### poll
    poll = Poll.new do |p|
      p.start_date = DateTime.now - 5.days
      p.end_date = DateTime.now - 1.days
    end
    poll.save(validate: false)

    Advising.create do |a|
      a.poll = poll
      a.user = byrd
      a.candidate = morley
      a.judgement = Judgement.find_by(name: 'Wait') 
      a.comment = 'I do not believe he is ready yet.'
      a.submitted = true
    end
    Advising.create do |a|
      a.poll = poll
      a.user = hilliard
      a.candidate = morley
      a.judgement = Judgement.find_by(name: 'Elevate') 
      a.comment = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus semper nunc. Sed ligula quam, euismod at arcu vitae, fermentum dictum felis. Nunc porta ex et eros hendrerit lacinia. In mattis nunc at felis aliquet, vitae varius leo mollis. Aenean congue sagittis rutrum. Aliquam mattis orci ac ornare porta. Integer mollis ullamcorper justo, ut fermentum neque volutpat eu. Cras viverra ex ut libero gravida tincidunt id in leo. Nulla mattis sollicitudin diam eget commodo. Nam dui odio, volutpat sed erat a, tempus maximus diam. Nunc dictum enim vitae dolor venenatis, vitae vulputate orci sodales. In hac habitasse platea dictumst. Aliquam erat volutpat. Quisque gravida sem et eros accumsan ultricies. Morbi ante tellus, semper at commodo sit amet, pharetra vitae mauris. Nulla at viverra mi, vel congue ex.

In eget erat vestibulum, placerat nunc ut, dapibus enim. Sed non sem nec velit mollis iaculis. Ut rhoncus finibus felis, ac interdum quam accumsan ac. Praesent nunc nisl, tempus quis pretium sed, semper in diam. Curabitur id imperdiet ligula. Fusce non felis dolor. Phasellus auctor est mi, eget dignissim sem ullamcorper nec. Nam purus orci, hendrerit non iaculis vel, posuere molestie eros. Fusce posuere efficitur neque, eget varius justo sodales at.

Nunc vehicula purus elementum, volutpat mauris ac, imperdiet ante. Pellentesque pretium ut erat sed egestas. Nulla facilisi. Aliquam ac cursus elit, pharetra cursus justo. Donec facilisis egestas eros facilisis vestibulum. Suspendisse nec tristique quam. Vivamus metus ante, condimentum non viverra ac, mollis nec diam.

Mauris iaculis lectus lacinia ex porta, a ullamcorper enim auctor. Duis tempus tincidunt arcu sed blandit. In sed sodales augue, vitae pretium neque. Pellentesque nec dapibus felis. Fusce lacinia nibh purus, venenatis blandit nunc ullamcorper ut. Etiam sed blandit massa. Sed condimentum cursus mollis. Vestibulum nec felis non ante tempus sollicitudin. Etiam sollicitudin urna vitae lacinia aliquet. Mauris imperdiet quam hendrerit libero tincidunt, et condimentum odio convallis. Aliquam erat volutpat. Proin urna justo, sodales faucibus auctor sed, sodales et risus.

Proin sit amet turpis nec velit euismod sodales at non libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam eu congue ligula. Aenean tincidunt mauris eros, facilisis malesuada leo vulputate eu. Aliquam viverra sollicitudin turpis.'
      a.submitted = true
    end
    Advising.create do |a|
      a.poll = poll
      a.user = holbein
      a.candidate = morley
      a.judgement = Judgement.find_by(name: 'Drop') 
      a.comment = 'No way man.'
      a.submitted = true
    end
    Advising.create do |a|
      a.poll = poll
      a.user = byrd
      a.candidate = oliver
      a.judgement = Judgement.find_by(name: 'Elevate') 
      a.comment = 'Looks great!'
      a.submitted = true
    end
    Advising.create do |a|
      a.poll = poll
      a.user = hilliard
      a.candidate = oliver
      a.judgement = Judgement.find_by(name: 'Elevate') 
      a.comment = 'Looks great!'
      a.submitted = true
    end
    Advising.create do |a|
      a.poll = poll
      a.user = holbein
      a.candidate = oliver
      a.judgement = Judgement.find_by(name: 'Drop') 
      a.comment = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus semper nunc. Sed ligula quam, euismod at arcu vitae, fermentum dictum felis. Nunc porta ex et eros hendrerit lacinia. In mattis nunc at felis aliquet, vitae varius leo mollis. Aenean congue sagittis rutrum. Aliquam mattis orci ac ornare porta. Integer mollis ullamcorper justo, ut fermentum neque volutpat eu. Cras viverra ex ut libero gravida tincidunt id in leo. Nulla mattis sollicitudin diam eget commodo. Nam dui odio, volutpat sed erat a, tempus maximus diam. Nunc dictum enim vitae dolor venenatis, vitae vulputate orci sodales. In hac habitasse platea dictumst. Aliquam erat volutpat. Quisque gravida sem et eros accumsan ultricies. Morbi ante tellus, semper at commodo sit amet, pharetra vitae mauris. Nulla at viverra mi, vel congue ex.

In eget erat vestibulum, placerat nunc ut, dapibus enim. Sed non sem nec velit mollis iaculis. Ut rhoncus finibus felis, ac interdum quam accumsan ac. Praesent nunc nisl, tempus quis pretium sed, semper in diam. Curabitur id imperdiet ligula. Fusce non felis dolor. Phasellus auctor est mi, eget dignissim sem ullamcorper nec. Nam purus orci, hendrerit non iaculis vel, posuere molestie eros. Fusce posuere efficitur neque, eget varius justo sodales at.

Nunc vehicula purus elementum, volutpat mauris ac, imperdiet ante. Pellentesque pretium ut erat sed egestas. Nulla facilisi. Aliquam ac cursus elit, pharetra cursus justo. Donec facilisis egestas eros facilisis vestibulum. Suspendisse nec tristique quam. Vivamus metus ante, condimentum non viverra ac, mollis nec diam.

Mauris iaculis lectus lacinia ex porta, a ullamcorper enim auctor. Duis tempus tincidunt arcu sed blandit. In sed sodales augue, vitae pretium neque. Pellentesque nec dapibus felis. Fusce lacinia nibh purus, venenatis blandit nunc ullamcorper ut. Etiam sed blandit massa. Sed condimentum cursus mollis. Vestibulum nec felis non ante tempus sollicitudin. Etiam sollicitudin urna vitae lacinia aliquet. Mauris imperdiet quam hendrerit libero tincidunt, et condimentum odio convallis. Aliquam erat volutpat. Proin urna justo, sodales faucibus auctor sed, sodales et risus.

Proin sit amet turpis nec velit euismod sodales at non libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam eu congue ligula. Aenean tincidunt mauris eros, facilisis malesuada leo vulputate eu. Aliquam viverra sollicitudin turpis.'
      a.submitted = true
    end
  end



  task :all => [:db_reset, :groups, :people, :calc_poll]
end
