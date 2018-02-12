FactoryBot.define do
  factory :document do
    name 'String'
    peer
    candidate
    document { File.new("#{Rails.root}/spec/fixtures/images/portrait.jpg") }
  end
  factory :poll_result do
    candidate
    poll 
    drop 1
    no_strong_opinion 1
    wait 1
    elevate 1
    rec 1.5
    fav 1.5
  end
  factory :advising do
    peer
    candidate 
    poll
    judgement nil
    comment "My Advice to the Crown on this Candidate is... Yay"
  end
  factory :poll do
    peerage_type :laurel
    start_date (DateTime.now + 1.days)
    end_date (DateTime.now+2.days)
  end
  factory :future_poll, class: Poll do 
    peerage_type :laurel
    start_date (DateTime.now + 1.days)
    end_date (DateTime.now+2.days)
  end
  factory :past_poll, class: Poll do 
    to_create {|instance| instance.save(validate: false) }
    peerage_type :laurel
    start_date (DateTime.now - 5.days)
    end_date (DateTime.now-2.days)
  end
  factory :current_poll, class: Poll do 
    to_create {|instance| instance.save(validate: false) }
    peerage_type :laurel
    start_date (DateTime.now - 2.days)
    end_date (DateTime.now+2.days)
  end
  factory :group do
    name "My String"
    slug "my_string"
    ancestry nil
    group_type
  end
  factory :group_type do
    name "MyString"
  end
  factory :comment do
    peer
    candidate 
    text "MyText"
  end
  factory :advocacy do
    peer
    candidate 
    apprenticeship false
  end

  factory :candidate, aliases: [:laurel_candidate] do
    sca_name "MyString"
    peerage_type :laurel
  end
  factory :pelican_candidate, parent: :candidate do
    peerage_type :pelican
  end

  factory :specialization do
    peer
    specialty 
    candidate
  end
  factory :specialty do
    name "MyString"
    peerage_type :laurel
    slug 'my_string'
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :peer, aliases: [:laurel_peer]  do
    active true
    vigilant false
    type "Laurel"
    association :user
  end

  factory :pelican_peer, parent: :peer  do
    type 'Pelican'
  end

  factory :dependency do
    peer
    association :superior , factory: :peer
  end

  factory :user do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    group
    sca_name 'Mundungus Jones'
  end
 
  factory :royal, parent: :user do
    royalty true
  end

  factory :laurel_user, parent: :user do
    sca_name 'Lester Laurel'
    after(:create) do |u|
      create(:laurel_peer, user: u)
    end
  end

  factory :pelican_user, parent: :user do
      sca_name 'Peter Pelican'
      after(:create) do |u|
        create(:pelican_peer, user: u)
      end
  end

  factory :admin, aliases: [:laurel_admin], parent: :user do
    sca_name "Mundugus Admin"
    after(:create) do |u|
       create(:laurel_peer, user: u, admin: true)
    end
  end

  factory :pelican_admin, parent: :user do
    sca_name "Mundingus Admin"
    after(:create) do |u|
       create(:pelican_peer, user: u, admin: true)
    end
  end

end
