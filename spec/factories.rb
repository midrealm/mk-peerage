FactoryGirl.define do
  #factory :dependency do
  #  peer nil
  #  superior nil
  #end
  factory :peer do
    active true
    vigilant false
    type "Laurel"
    user
  end
  factory :image do
    image ""
    candidate
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
    judgement 
    comment "My Advice to the Crown on this Candidate is... Yay"
  end
  factory :judgement do
    name "MyString"
  end
  factory :poll do
    start_date (DateTime.now + 1.days)
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
  factory :candidate do
    sca_name "MyString"
    peerage_type :laurel
  end
  #factory :apprenticeship do
  #  user 
  #  laurel_id 1 
  #end
  factory :specialization do
    peer
    specialty 
    candidate
  end
  factory :specialty do
    name "MyString"
    peerage_type :laurel
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    sca_name "Mundugus Jones"
    group
    after(:create) do |u|
      create(:peer, user: u, active: true, vigilant: false, type: 'Laurel')
    end
  end

  factory :pelican, class: User do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    sca_name "Penny Pelican"
    group
    after(:create) do |u|
      create(:peer, user: u, active: true, vigilant: false, type: 'Pelican')
    end
  end

  
  factory :admin, class: User do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    sca_name "Mundugus Admin"
    group
    after(:create) do |u|
       create(:peer, user: u, admin: true, active: true, vigilant: false, type: 'Laurel')
    end
     
  end

  factory :royal, class: User do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    sca_name "Mundugus Jones"
    royalty true
  end
end
