task :candidate => :environment do  
  vote = Candidate.create do |u|
    u.sca_name = 'Vote List Candidate'
    u.vote = true
  end
  Specialization.create(candidate: vote, specialty: Specialty.find_by(name: 'Music'))
  Specialization.create(candidate: vote, specialty: Specialty.find_by(name: 'Earwax Studies'))
  Advocacy.create(candidate: vote, user: User.find_by(sca_name: 'Jadwiga Kryzawnowska'))
  Advocacy.create(candidate: vote, user: User.find_by(sca_name: 'Joe Vigilant'))

  watch = Candidate.create do |u|
    u.sca_name = 'Watch List Candidate'
    u.vote = false
  end
  Specialization.create(candidate: watch, specialty: Specialty.find_by(name: 'Costuming'))
  Advocacy.create(candidate: watch, user: User.find_by(sca_name: 'Jadwiga Kryzawnowska'))
end
