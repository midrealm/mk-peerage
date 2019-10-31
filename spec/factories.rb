FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :news, aliases: [:laurel_news] do
    peerage_type { :laurel }
    body { "So much News News News News" }
  end

  factory :document do
    name { 'String' }
    association :peer, strategy: :build
    association :candidate, strategy: :build
    after(:create) do |d|
      d.document.attach(io: File.open("#{Rails.root}/spec/fixtures/images/portrait.jpg"), filename: 'portrait.jpg', content_type: 'image/jpeg') 
    end
  end
  factory :poll_result do
    association :candidate, strategy: :build
    association :poll, strategy: :build 
    drop { 1 }
    no_strong_opinion {1}
    wait {1}
    elevate {1}
    rec {1.5}
    fav {1.5}
  end
  factory :advising do
    association :peer, strategy: :build 
    association :candidate, strategy: :build 
    association :poll, strategy: :build
    judgement {nil}
    comment {"My Advice to the Crown on this Candidate is... Yay"}
  end
  factory :poll do
    peerage_type {:laurel}
    start_date {(DateTime.now + 1.days)}
    end_date {(DateTime.now+2.days)}
  end
  factory :future_poll, class: Poll do 
    peerage_type {:laurel}
    start_date {(DateTime.now + 1.days)}
    end_date {(DateTime.now+2.days)}
  end
  factory :past_poll, class: Poll do 
    to_create {|instance| instance.save(validate: false) }
    peerage_type {:laurel}
    start_date {(DateTime.now - 5.days)}
    end_date {(DateTime.now-2.days)}
  end
  factory :current_poll, class: Poll do 
    to_create {|instance| instance.save(validate: false) }
    peerage_type {:laurel}
    start_date {(DateTime.now - 2.days)}
    end_date {(DateTime.now+2.days)}
  end
  factory :group do
    name {"My String"}
    slug {"my_string"}
    ancestry {nil}
    association :group_type, strategy: :build
  end
  factory :group_type do
    name {"MyString"}
  end
  factory :comment do
    association :peer, strategy: :build
    association :candidate, strategy: :build 
    text {"MyText"}
  end
  factory :advocacy do
    association :peer, strategy: :build
    association :candidate, strategy: :build 
    apprenticeship {false}
  end

  factory :candidate, aliases: [:laurel_candidate] do
    sca_name {"MyString"}
    peerage_type {:laurel}
  end
  factory :pelican_candidate, parent: :candidate do
    peerage_type {:pelican}
  end

  factory :specialization do
    #association :peer, strategy: :build
    association :specialty, strategy: :build 
    #association :candidate, strategy: :build
  end
  factory :specialty do
    name {"MyString"}
    peerage_type {:laurel}
    slug {'my_string'}
    ancestry {nil}
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :peer, aliases: [:laurel_peer]  do
    active {true}
    vigilant {false}
    type {"Laurel"}
    association :user
  end

  factory :pelican_peer, parent: :peer  do
    type {'Pelican'}
  end

  factory :dependency do
    association :peer, strategy: :build
    association :superior , factory: :peer
  end

  factory :user do
    email {generate :email}
    password {Devise.friendly_token.first(8)  }
    association :group, strategy: :build
    sca_name {'Mundungus Jones'}
  end
 
  factory :royal, parent: :user do
    royalty {true}
  end

  factory :laurel_user, parent: :user do
    sca_name {'Lester Laurel'}
    after(:create) do |u|
      create(:laurel_peer, user: u)
    end
  end

  factory :pelican_user, parent: :user do
      sca_name {'Peter Pelican'}
      after(:create) do |u|
        create(:pelican_peer, user: u)
      end
  end

  factory :admin, aliases: [:laurel_admin], parent: :user do
    sca_name {"Mundugus Admin"}
    after(:create) do |u|
       create(:laurel_peer, user: u, admin: true)
    end
  end

  factory :pelican_admin, parent: :user do
    sca_name {"Mundingus Admin"}
    after(:create) do |u|
       create(:pelican_peer, user: u, admin: true)
    end
  end

end
