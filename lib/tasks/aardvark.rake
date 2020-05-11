namespace :peer_migrate do
  task :migrate => :environment do
    u1 = User.find_or_create_by(sca_name: "Huon Damebrigge") do |user|
       user.email = "jlmatterer@yahoo.com"
       user.password = "axLXlcK9"
       user.modern_name = "J Lewis Matterer"
    end
    u1 = User.find_for_authentication(email: "jlmatterer@yahoo.com") unless u1.valid?
    unless u1.arms.attached?
      u1.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/310.gif'), filename: '310.gif', content_type: 'images/gif');
    end
    p1 = Peer.create(user: u1, type: 'Pelican', elevated_by: "AEthelmearc", elevation_date: Date.parse("2011-10-22"), active: true, vigilant: false, bio: "Joined the SCA March 11, 1979. Order of the Laurel, Order of the Pelican, Order of the Maunche (EK), Order of the Millrind (AE), AEthelmearc Keystone, AEthelmearc Sycamore, Royal Baker of AEthelmearc, Fellow of the AEthemearc Academy, Sigil of AEthelmearc, AEthelmearc Kingdom Deputy Master of Arts & Sciences (2004-2005), Green Comet (BMDL), Silver Comet (BMDL), Order of the Horse (Bhakail). Website: http://www.godecookery.com/ ; Facebook: https://www.facebook.com/TheGodeCook")
    p1.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/310.png'), filename: '310.png', content_type: 'images/png');
    u2 = User.find_or_create_by(sca_name: "Kyppyn Kirkcaldy") do |user|
       user.email = "syrkyppyn@mail.com"
       user.password = "l8dKnk80"
       user.modern_name = "Kipp Martines"
    end
    u2 = User.find_for_authentication(email: "syrkyppyn@mail.com") unless u2.valid?
    unless u2.arms.attached?
      u2.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/255.gif'), filename: '255.gif', content_type: 'images/gif');
    end
    p2 = Peer.create(user: u2, type: 'Pelican', elevated_by: "Ullr & AnneLyse", elevation_date: Date.parse("2008-10-18"), active: false, vigilant: false, bio: "###   

##### PERSONA

_My Persona is a 10th century norseman._

##### SCA CAREER

_I have been in the SCA since 1989. In addition to serving the Society, I do SCA Armored combat, SCA Rapier Combat, woodworking, armor construction, leather craft, and illumination. My household, Paragon Keep, is comprised of many fighters, artisans, and good gentles dedicated to service in the SCA._

###  [www.paragonkeep.org](http://www.paragonkeep.org)

### AWARDS

#### The Middle Kingdom
Court Baron Order of the PelicanRoyal Augmentation of ArmsOrder of the Sapphire Order of the Silver OakAugustine Prize 2005- Service to the Chroniclers officePurple Fret - AoA level service award
#### Kingdom of Meridies  

KSCA - Knight of the Society  
CKP- Sovereign’s Pleasure - Service to the King during His Reign  
CMM- Meridian Majesty - Service to the Queen during Her Reign  
CBM- Bough of Meridies - Grant level Service award  
CAS- Argent Shield - AoA level fighting award  
GOA - Grant of Arms  
CMC- Meridian Cross - AoA level Arts & Science award  
CSG- Sable Gryphon - Baronial AoA level award  
AOA - Award of Arms

#### Barony of Thor's Mountain

CRHS- Ram's Horn for Service  
CRHF- Ram's Horn for Fighting  
CSH- Silver Heart for chivalry to the ladies of the Barony  
CAF- Argent Feather - Service to the Baronial newsletter

#### Barony of Flaming Gryphon
  
Flaming Brand - Service to the Barony  
Gryphon's Plume - Service to the Arts & Sciences  
Sable Shield - Service to the Martial Arts
#### Society Awards

William Black Fox- 2005 for Best Layout")
    p2.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/255.png'), filename: '255.png', content_type: 'images/png');
    u3 = User.find_or_create_by(sca_name: "Melisande de Canonwald") do |user|
       user.email = "stephanie.drummonds@gmail.com"
       user.password = "7KqC9NFS"
       user.modern_name = "Stephanie Drummonds"
    end
    u3 = User.find_for_authentication(email: "stephanie.drummonds@gmail.com") unless u3.valid?
    unless u3.arms.attached?
      u3.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/256.gif'), filename: '256.gif', content_type: 'images/gif');
    end
    p3 = Peer.create(user: u3, type: 'Pelican', elevated_by: "Ullr and AnneLyse", elevation_date: Date.parse("2009-02-27"), active: true, vigilant: false, bio: "Elevated by Ullr & Annelyse on February 27, 2009;   Region: South Oaken;   Phone: 513-403-3301;   Email: stephanie.drummonds@gmail.com ;")
    p3.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/256.png'), filename: '256.png', content_type: 'images/png');
    u4 = User.find_or_create_by(sca_name: "Aaron Faheud Swiftrunner of the Stone Keep") do |user|
       user.email = "Faheud@aol.com"
       user.password = "1fGanUnZ"
       user.modern_name = "George Reed"
    end
    u4 = User.find_for_authentication(email: "Faheud@aol.com") unless u4.valid?
    p4 = Peer.create(user: u4, type: 'Pelican', elevated_by: "Finn & Garlanda", elevation_date: Date.parse("1994-08-19"), active: true, vigilant: false, bio: "")
    p4.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/4.png'), filename: '4.png', content_type: 'images/png');
    u5 = User.find_or_create_by(sca_name: "Aedan o Kincorra") do |user|
       user.email = "pelican5@example.com"
       user.password = "7CJzIiUC"
       user.modern_name = ""
    end
    u5 = User.find_for_authentication(email: "pelican5@example.com") unless u5.valid?
    p5 = Peer.create(user: u5, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1989-05-13"), active: false, vigilant: false, bio: "")
    u6 = User.find_or_create_by(sca_name: "Alan Culross") do |user|
       user.email = "mikes@siralan.org"
       user.password = "VmknzdkF"
       user.modern_name = "Michael L. Squires"
    end
    u6 = User.find_for_authentication(email: "mikes@siralan.org") unless u6.valid?
    unless u6.arms.attached?
      u6.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/6.gif'), filename: '6.gif', content_type: 'images/gif');
    end
    p6 = Peer.create(user: u6, type: 'Pelican', elevated_by: "Comar gyr Mirand and Lisa Dolorosa", elevation_date: Date.parse("1990-08-18"), active: true, vigilant: false, bio: "Elevated 8/18/90 by Comar gyr Mirand and Lisa Dolorosa")
    p6.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/6.png'), filename: '6.png', content_type: 'images/png');
    u7 = User.find_or_create_by(sca_name: "Aleksandra Ivanovna Nemka") do |user|
       user.email = "sandra.brownge@gmail.com"
       user.password = "bRru0g7A"
       user.modern_name = ""
    end
    u7 = User.find_for_authentication(email: "sandra.brownge@gmail.com") unless u7.valid?
    p7 = Peer.create(user: u7, type: 'Pelican', elevated_by: "Comar gyr Mirand and Lisa Dolorosa", elevation_date: Date.parse("1990-08-18"), active: true, vigilant: false, bio: "")
    u8 = User.find_or_create_by(sca_name: "Alessandra dal Castelsalice") do |user|
       user.email = "pelican8@example.com"
       user.password = "RkfdLhZg"
       user.modern_name = ""
    end
    u8 = User.find_for_authentication(email: "pelican8@example.com") unless u8.valid?
    p8 = Peer.create(user: u8, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u9 = User.find_or_create_by(sca_name: "Alexis MacAlister of Beverlay") do |user|
       user.email = "bevroden@gmail.com"
       user.password = "wioerddN"
       user.modern_name = "Beverly Roden"
    end
    u9 = User.find_for_authentication(email: "bevroden@gmail.com") unless u9.valid?
    unless u9.arms.attached?
      u9.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/9.gif'), filename: '9.gif', content_type: 'images/gif');
    end
    p9 = Peer.create(user: u9, type: 'Pelican', elevated_by: "Dag & Elayna", elevation_date: Date.parse("1999-02-06"), active: false, vigilant: false, bio: " 

 Here's my personal award history.  More details to come...

| [Order of the Pelican](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=170) | 2/6/1999 |
| [Court Baron / Baroness](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=175) | 3/1/1997 |
| [Order of the Dragon's Heart](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=176) | 11/18/1995 |
| [Award of the Doe's Grace](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=182) | 10/15/1994 |
| Principality Company of Sojourners | 5/8/1993 |
| 

[Grant of Arms](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=173)

 | 8/13/1992 |
| [Order of the Laurel](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=169) | 10/12/1991 |
| [Award of the Purple Fret](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=181) | 7/15/1990 |
| [Order of the Willow](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=178) | 12/17/1988 |
| [Award of the Purple Fret](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=181) | 9/19/1987 |
| [Order of the Flaming Brand](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=190) | 1/12/1987 |
| [Award of Arms](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=187) | 7/10/1982 |
| [Order of the Gryphon's Plume](http://www.midrealm.org/gryphony/op/fgop.phtml?searchvar=byhonor&input2=191) | 7/10/1982 |
|   |   |")
    p9.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/9.png'), filename: '9.png', content_type: 'images/png');
    u10 = User.find_or_create_by(sca_name: "Alfred of Chester") do |user|
       user.email = "baronaoc@aol.com"
       user.password = "5oFJEWbn"
       user.modern_name = "C. Allen Reed"
    end
    u10 = User.find_for_authentication(email: "baronaoc@aol.com") unless u10.valid?
    p10 = Peer.create(user: u10, type: 'Pelican', elevated_by: "Finn Herjolfsson and Garlanda de Stanas", elevation_date: Date.parse("1994-06-11"), active: true, vigilant: false, bio: "Elevated 6/11/94 by Finn Herjolfsson and Garlanda de Stanas")
    p10.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/10.png'), filename: '10.png', content_type: 'images/png');
    u11 = User.find_or_create_by(sca_name: "Alinor of Braeford") do |user|
       user.email = "pelican11@example.com"
       user.password = "tfgAHf9N"
       user.modern_name = ""
    end
    u11 = User.find_for_authentication(email: "pelican11@example.com") unless u11.valid?
    p11 = Peer.create(user: u11, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 1/9/93 by Finn Herjolfsson and Garlanda de Stanas")
    u12 = User.find_or_create_by(sca_name: "Alys Katharine") do |user|
       user.email = "alyskatharine@gmail.com"
       user.password = "N2hKNleZ"
       user.modern_name = "Elise Fleming"
    end
    u12 = User.find_for_authentication(email: "alyskatharine@gmail.com") unless u12.valid?
    unless u12.arms.attached?
      u12.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/12.gif'), filename: '12.gif', content_type: 'images/gif');
    end
    p12 = Peer.create(user: u12, type: 'Pelican', elevated_by: "Finn Herjolfsson and Garlanda de Stanas", elevation_date: Date.parse("1994-08-20"), active: true, vigilant: false, bio: "Served as first and third Midrealm Chatelaine. Was Society Chatelaine for five years. Coordinated Pennsic classes for six years. Served as Midrealm Queen with Valharic, King, in 2002. Became Pale Herald in 2003 and currently still serving. Proofreader for The Pale, Compleat Anachronist, and the Northwatch (Northshield).")
    p12.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/12.png'), filename: '12.png', content_type: 'images/png');
    u13 = User.find_or_create_by(sca_name: "Andrew of Seldomrest") do |user|
       user.email = "pelican13@example.com"
       user.deceased = true,
       user.password = "a1SBvArX"
       user.modern_name = ""
    end
    u13 = User.find_for_authentication(email: "pelican13@example.com") unless u13.valid?
    unless u13.arms.attached?
      u13.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/13.gif'), filename: '13.gif', content_type: 'images/gif');
    end
    p13 = Peer.create(user: u13, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 10/9/76 by Albert von Dreckenveldt and Selene of the Sky")
    p13.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/13.png'), filename: '13.png', content_type: 'images/png');
    u14 = User.find_or_create_by(sca_name: "Anne Geoffreys of Warwick") do |user|
       user.email = "pelican14@example.com"
       user.password = "tDOhjU5W"
       user.modern_name = ""
    end
    u14 = User.find_for_authentication(email: "pelican14@example.com") unless u14.valid?
    p14 = Peer.create(user: u14, type: 'Pelican', elevated_by: "Thorbjorn Osis Brandsson and Valthiona Cuthbert", elevation_date: Date.parse("1995-07-08"), active: false, vigilant: false, bio: "Elevated 7/8/95 by Thorbjorn Osis Brandsson and Valthjona Cuthbert")
    u15 = User.find_or_create_by(sca_name: "Arwenna of Kelsley") do |user|
       user.email = "pkelley@theelms.org"
       user.password = "I6GZxAtG"
       user.modern_name = "Patricia Kelley"
    end
    u15 = User.find_for_authentication(email: "pkelley@theelms.org") unless u15.valid?
    p15 = Peer.create(user: u15, type: 'Pelican', elevated_by: "Tarquin and Aibhilin", elevation_date: Date.parse("1996-04-15"), active: true, vigilant: false, bio: "")
    p15.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/15.png'), filename: '15.png', content_type: 'images/png');
    u16 = User.find_or_create_by(sca_name: "Arwyn Antarae") do |user|
       user.email = "pelican16@example.com"
       user.password = "41XvBuSi"
       user.modern_name = ""
    end
    u16 = User.find_for_authentication(email: "pelican16@example.com") unless u16.valid?
    p16 = Peer.create(user: u16, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u17 = User.find_or_create_by(sca_name: "Aureliane Rioghail") do |user|
       user.email = "pelican17@example.com"
       user.password = "ZEG0moVG"
       user.modern_name = ""
    end
    u17 = User.find_for_authentication(email: "pelican17@example.com") unless u17.valid?
    p17 = Peer.create(user: u17, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u18 = User.find_or_create_by(sca_name: "Barak Carthalo") do |user|
       user.email = "pelican18@example.com"
       user.password = "55Ff5Kf6"
       user.modern_name = ""
    end
    u18 = User.find_for_authentication(email: "pelican18@example.com") unless u18.valid?
    p18 = Peer.create(user: u18, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u19 = User.find_or_create_by(sca_name: "Bardolf Ulfacson") do |user|
       user.email = "pelican19@example.com"
       user.password = "XYUexM8R"
       user.modern_name = ""
    end
    u19 = User.find_for_authentication(email: "pelican19@example.com") unless u19.valid?
    p19 = Peer.create(user: u19, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1996-05-11"), active: false, vigilant: false, bio: "Elevated 5/11/96 by Edmund of Hertford and Katryn Bronwyn of Glouchester")
    u20 = User.find_or_create_by(sca_name: "Bardolph Odger Windlaufer") do |user|
       user.email = "pelican20@example.com"
       user.password = "B8Imv89i"
       user.modern_name = ""
    end
    u20 = User.find_for_authentication(email: "pelican20@example.com") unless u20.valid?
    unless u20.arms.attached?
      u20.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/20.gif'), filename: '20.gif', content_type: 'images/gif');
    end
    p20 = Peer.create(user: u20, type: 'Pelican', elevated_by: "Thorbjorn Osis Brandsson and Valthjona Cuthbert", elevation_date: Date.parse("1995-05-27"), active: true, vigilant: false, bio: "")
    p20.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/20.png'), filename: '20.png', content_type: 'images/png');
    u21 = User.find_or_create_by(sca_name: "Brand Thorwaldsen") do |user|
       user.email = "pelican21@example.com"
       user.password = "gyR1dhbQ"
       user.modern_name = ""
    end
    u21 = User.find_for_authentication(email: "pelican21@example.com") unless u21.valid?
    p21 = Peer.create(user: u21, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u22 = User.find_or_create_by(sca_name: "Bronwyn ferch Gwyn ap Rhys") do |user|
       user.email = "bronwyn@tds.net"
       user.password = "fh5tZB5t"
       user.modern_name = "Bronwyn Noble"
    end
    u22 = User.find_for_authentication(email: "bronwyn@tds.net") unless u22.valid?
    p22 = Peer.create(user: u22, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 11/5/94 by Brannos O'longardail and Rebekah MacTiernan")
    u23 = User.find_or_create_by(sca_name: "Brummbar von Schwarzberg") do |user|
       user.email = "pelican23@example.com"
       user.password = "3ODqQqNz"
       user.modern_name = ""
    end
    u23 = User.find_for_authentication(email: "pelican23@example.com") unless u23.valid?
    p23 = Peer.create(user: u23, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u24 = User.find_or_create_by(sca_name: "Brusten de Bearsul") do |user|
       user.email = "pat.epub@gmail.com"
       user.password = "Pe2Fu0fW"
       user.modern_name = "Patrick Smith"
    end
    u24 = User.find_for_authentication(email: "pat.epub@gmail.com") unless u24.valid?
    unless u24.arms.attached?
      u24.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/24.gif'), filename: '24.gif', content_type: 'images/gif');
    end
    p24 = Peer.create(user: u24, type: 'Pelican', elevated_by: "HRM Finn and Garlanda", elevation_date: Date.parse("1994-08-20"), active: true, vigilant: false, bio: "Order of Chivalry - Knight 12 Aug, 1978 (A.S. 13)(resign 25 May 1980),  
  Order of the Laurel 20 Aug, 1994 (A.S. 29)   
  Order of the Pelican 20 Aug, 1994 (A.S. 29)  
  Court Baron 19 Apr, 2014 (A.S. 48)   
  Grant of Arms 20 May, 1978 (A.S. 13)( resign 25 May 1980)  
  Grant of Arms 24 Feb, 1996 (A.S. 30)   
  Order of the Dragon\'s Heart 6 Jan, 1979 (A.S. 13)(resign 25 May 1980)   
  Order of the Dragon\'s Heart 20 Nov, 1993 (A.S. 28)   
  Order of the Silver Oak 20 Jan, 1990 (A.S. 24)   
  Award of the Purple Fret 26 May, 1990 (A.S. 25)  
  Award of Arms 31 Jan, 1976 (A.S. 10)   
  Order of the Royal Vanguard 02 Oct, 1993 (A.S. 28)   
  Augmentation of Arms 19 Jul, 1975   
  (A boar\'s head together with the name Boarsbane)  
  
  
  Baronial awards:   
  Order of the White Wolf (Northwoods) 07 Dec, 1974   
  Order of the Gryphons Fire (Principal) (Flaming Gryphon) 1 Nov 2008   
  Order of the Flaming Brand (Flaming Gryphon) 14 Oct, 1989  
  Order of the Gryphons Spear (Flaming Gryphon) 23 Jul, 1994   
  Order of the Gryphons Plume (Flaming Gryphon) 10 July , 2004   
  Order of the Sable Shield (Principal) (Flaming Gryphon) 01 Oct, 1994   
  Academie de Griffe (Flaming Gryphon) 9 July, 2011   
  
  Offices held:   
  Former Midrealm Chronicler   
  Former Midrealm Chirurgeon   
  Former Regional Marshal   
  Former Deputy to the Dragon Herald   
  Former Deputy to the Society Chirurgeon   
  Former Pennsic War Chirurgeon in Charge   
  Former Baronial Seneschal   
  Former Baronial Exchequer   
  Former Order Secretary for Laurels & for Pelicans   
  Current Marshal at large (Heavy)   
 Current Marshal at large (Rapier)   
  
   Author of Compleat Anachronist #71 - \'Period Pastimes\'  
 Compleat Anachronist #79 - \'Non-European Games\'  
  
 TAVERN GAMES class handout:  
 http://brusten.livejournal.com/662.html?#cutid1  
  
 A history of the Great Stick of Ealdermere:  
 http://brusten.livejournal.com/1553.html?#cutid1  
  
 A history of the 13th Century Tournament - the first Pas de Armes in Midrealm history:  
 http://brusten.livejournal.com/887.html?#cutid1  
  
 On the origin of Squire\'s Belts in the Midrealm:   
 http://brusten.livejournal.com/1157.html?#cutid1  
  
 A short history of Michael of Boarshaven:  
 http://brusten.livejournal.com/1515.html?#cutid1")
    p24.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/24.png'), filename: '24.png', content_type: 'images/png');
    u25 = User.find_or_create_by(sca_name: "Caellyn y'Vearn Fitzhugh") do |user|
       user.email = "pelican25@example.com"
       user.password = "XEFLr9mN"
       user.modern_name = ""
    end
    u25 = User.find_for_authentication(email: "pelican25@example.com") unless u25.valid?
    p25 = Peer.create(user: u25, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u26 = User.find_or_create_by(sca_name: "Caffa Muiriath") do |user|
       user.email = "pelican26@example.com"
       user.password = "BUr4uMQm"
       user.modern_name = ""
    end
    u26 = User.find_for_authentication(email: "pelican26@example.com") unless u26.valid?
    p26 = Peer.create(user: u26, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u27 = User.find_or_create_by(sca_name: "Caradoc Llew Du ap Morgan") do |user|
       user.email = "caradoc1415@yahoo.com"
       user.password = "i8tqFovV"
       user.modern_name = "Ross C. Quinn-Davis"
    end
    u27 = User.find_for_authentication(email: "caradoc1415@yahoo.com") unless u27.valid?
    unless u27.arms.attached?
      u27.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/27.gif'), filename: '27.gif', content_type: 'images/gif');
    end
    p27 = Peer.create(user: u27, type: 'Pelican', elevated_by: "Corin and Myfanwy", elevation_date: Date.parse("1985-08-17"), active: false, vigilant: false, bio: "     Baron of Nordskogen May 18, 1985 --stepped down, became Court Baron July 9, 1994 Order of the Dragon's Heart May 2, 1981 Award of the Purple Fret Oct. 27, 1979 Award of Arms July 10, 1976  Other awards: Award of the Guide Star (Northshield) Order of the River of Blood (Nordskogen) Order of the Heavy Cross (Nordleigh)  Offices: Herald (shire, first Principality, currently herald at large and internal commenter), Seneschal (shire, first Northshield regional), Marshal at large (current), Stallarar for Northshield as Crown Principality  Proteges elevated: TH Mistress Elysabet de Warren, Laurel, Pel.")
    p27.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/27.png'), filename: '27.png', content_type: 'images/png');
    u28 = User.find_or_create_by(sca_name: "Cariadoc of the Bow") do |user|
       user.email = "pelican28@example.com"
       user.password = "y3iS6hab"
       user.modern_name = ""
    end
    u28 = User.find_for_authentication(email: "pelican28@example.com") unless u28.valid?
    p28 = Peer.create(user: u28, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u29 = User.find_or_create_by(sca_name: "Carlo dalla Casa") do |user|
       user.email = "cehughes@consolidated.net"
       user.password = "buxPIRiu"
       user.modern_name = "Charles E. Hughes"
    end
    u29 = User.find_for_authentication(email: "cehughes@consolidated.net") unless u29.valid?
    unless u29.arms.attached?
      u29.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/29.gif'), filename: '29.gif', content_type: 'images/gif');
    end
    p29 = Peer.create(user: u29, type: 'Pelican', elevated_by: "Fuyuzyru Tadashi and Kobayakawa Ariake", elevation_date: Date.parse("1990-01-13"), active: false, vigilant: false, bio: "Elevated 1/13/90 by Fuyuzyru Tadashi and Kobayakawa Ariake

 Laurel    1983-06-25    
    Pelican   1990-01-13    
    Court     1985-08-17    
    ODH       1987-10-24    
    OW        1982-11-20    
    APF       1984-05-27    
    ADG       1989-08-17    
    APF       1991-08-15    
    ORC       2002-05-26    
    AOA       1981-06-27

 Past Provost Royal University of the Midrealm

Past Chancellor of Royal University of the Midrealm

Past Commander of the Midlands Army.

 \"Service is a stealth activity in our Organization-  If done efficeintly, no one might notice.\"")
    p29.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/29.png'), filename: '29.png', content_type: 'images/png');
    u30 = User.find_or_create_by(sca_name: "Caroline de Mercier") do |user|
       user.email = "cmstoryteller@hotmail.com"
       user.password = "0vFyv6hW"
       user.modern_name = "Carol Mercer"
    end
    u30 = User.find_for_authentication(email: "cmstoryteller@hotmail.com") unless u30.valid?
    p30 = Peer.create(user: u30, type: 'Pelican', elevated_by: "David and Tangwystl", elevation_date: Date.parse("1991-08-31"), active: true, vigilant: false, bio: "")
    p30.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/30.png'), filename: '30.png', content_type: 'images/png');
    u31 = User.find_or_create_by(sca_name: "Catherine Aimee le Moyne de Bretagne") do |user|
       user.email = "aimee@di.org"
       user.password = "X5lPC1xM"
       user.modern_name = "AimÃƒÂ©e Masquelier Moran"
    end
    u31 = User.find_for_authentication(email: "aimee@di.org") unless u31.valid?
    unless u31.arms.attached?
      u31.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/31.gif'), filename: '31.gif', content_type: 'images/gif');
    end
    p31 = Peer.create(user: u31, type: 'Pelican', elevated_by: "Talymar and Eislinn", elevation_date: Date.parse("1987-08-17"), active: true, vigilant: false, bio: "")
    p31.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/31.png'), filename: '31.png', content_type: 'images/png');
    u32 = User.find_or_create_by(sca_name: "Catherine de la Rose") do |user|
       user.email = "pelican32@example.com"
       user.password = "MMdSBM1U"
       user.modern_name = ""
    end
    u32 = User.find_for_authentication(email: "pelican32@example.com") unless u32.valid?
    p32 = Peer.create(user: u32, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u34 = User.find_or_create_by(sca_name: "Claire Fitzwilliam of Lynnwood Keep") do |user|
       user.email = "clairefw2@gmail.com"
       user.password = "IsJanGvD"
       user.modern_name = "Linda Duvall"
    end
    u34 = User.find_for_authentication(email: "clairefw2@gmail.com") unless u34.valid?
    p34 = Peer.create(user: u34, type: 'Pelican', elevated_by: "Talymar gan y Llyn and Eislinn the Patient", elevation_date: Date.parse("1987-10-03"), active: true, vigilant: false, bio: "")
    p34.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/34.png'), filename: '34.png', content_type: 'images/png');
    u35 = User.find_or_create_by(sca_name: "Coley Cuthbert") do |user|
       user.email = "pelican35@example.com"
       user.password = "bgMzmZoT"
       user.modern_name = ""
    end
    u35 = User.find_for_authentication(email: "pelican35@example.com") unless u35.valid?
    p35 = Peer.create(user: u35, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u36 = User.find_or_create_by(sca_name: "Comar gyr Mirand") do |user|
       user.email = "mely@gcfn.org"
       user.password = "MJ57bQ9F"
       user.modern_name = "Mike Ely"
    end
    u36 = User.find_for_authentication(email: "mely@gcfn.org") unless u36.valid?
    unless u36.arms.attached?
      u36.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/36.gif'), filename: '36.gif', content_type: 'images/gif');
    end
    p36 = Peer.create(user: u36, type: 'Pelican', elevated_by: "Thorbjorn Osis Brandsson and Caitlin Stuart", elevation_date: Date.parse("1997-02-01"), active: true, vigilant: false, bio: "")
    p36.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/36.png'), filename: '36.png', content_type: 'images/png');
    u37 = User.find_or_create_by(sca_name: "Cordelia Tichy") do |user|
       user.email = "kamoor01@louisville.edu"
       user.password = "HLL92wzj"
       user.modern_name = "Kathy Moore"
    end
    u37 = User.find_for_authentication(email: "kamoor01@louisville.edu") unless u37.valid?
    p37 = Peer.create(user: u37, type: 'Pelican', elevated_by: "Comar and Lisa", elevation_date: Date.parse("1992-01-11"), active: true, vigilant: false, bio: "    
    
        
        
        |   | [Award of Arms](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=27) |   | [12 Feb, 1975](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1975&mon=02&day=12) (A.S. 9) |
        |   | [Award of the Purple Fret](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=19) |   | [15 Oct, 1977](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1977&mon=10&day=15) (A.S. 12) |
        |   | [Order of the Willow](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=15) |   | [12 Aug, 1978](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1978&mon=08&day=12) (A.S. 13) |
        |   | [Landed Baron / Baroness (resigned)](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=50)·  _Flame_ |   | [10 Dec, 1981](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1981&mon=12&day=10) (A.S. 16)- [12 Sep, 1998](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1998&mon=09&day=12) (A.S. 33) |
        |   | [Award of the Queen's Favor](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=21) |   | [11 Dec, 1982](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1982&mon=12&day=11) (A.S. 17) |
        |   | [Order of the Dragon's Heart](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=13) |   | [18 Jun, 1988](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1988&mon=06&day=18) (A.S. 23) |
        |   | [Order of the Willow](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=15) |   | [22 Jun, 1991](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1991&mon=06&day=22) (A.S. 26) |
        |   | [Order of the Pelican](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=7) |   | [11 Jan, 1992](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1992&mon=01&day=11) (A.S. 26) |
        |   | [Order of the Laurel](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=6) |   | [06 Feb, 1993](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1993&mon=02&day=06) (A.S. 27) |
        |   | [Award of the Purple Fret](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=19) |   | [28 Jan, 1995](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1995&mon=01&day=28) (A.S. 29) |
        |   | [Court Baron / Baroness](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=12) |   | [12 Sep, 1998](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1998&mon=09&day=12) (A.S. 33) |
        |   | [Kingdom Augmentation of Arms](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=36)·  _Argent, a pale gules over all a dragon passant vert_ |   | [02 Dec, 2000](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=2000&mon=12&day=02) (A.S. 35) |")
    p37.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/37.png'), filename: '37.png', content_type: 'images/png');
    u38 = User.find_or_create_by(sca_name: "Daemon de Folo") do |user|
       user.email = "pelican38@example.com"
       user.password = "HXfwzxHV"
       user.modern_name = ""
    end
    u38 = User.find_for_authentication(email: "pelican38@example.com") unless u38.valid?
    p38 = Peer.create(user: u38, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1978-08-12"), active: false, vigilant: false, bio: "")
    u39 = User.find_or_create_by(sca_name: "Dagan du Darregonne") do |user|
       user.email = "pelican39@example.com"
       user.deceased = true,
       user.password = "XmC8H6P0"
       user.modern_name = "Victor J. Townsend"
    end
    u39 = User.find_for_authentication(email: "pelican39@example.com") unless u39.valid?
    unless u39.arms.attached?
      u39.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/39.gif'), filename: '39.gif', content_type: 'images/gif');
    end
    p39 = Peer.create(user: u39, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1980-08-23"), active: false, vigilant: false, bio: "     Award of Arms May 12, 1973 Knight March 2, 1974 Count April 19, 1975 Duke May 14, 1977 Order of the Willow Sept 3, 1977 Order of the Purple Fret Oct 15, 1977 Dragon's Heart (1978?) Pelican August 23, 1980  Earl of Bould'n by HRM Rolac the Wise Granted \"Dagan's Hill\" at Cooper's Lake by HRM Alen Eligil I")
    p39.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/39.png'), filename: '39.png', content_type: 'images/png');
    u40 = User.find_or_create_by(sca_name: "Dathi Thorfinnsson") do |user|
       user.email = "pelican40@example.com"
       user.password = "SMrVEzzK"
       user.modern_name = ""
    end
    u40 = User.find_for_authentication(email: "pelican40@example.com") unless u40.valid?
    p40 = Peer.create(user: u40, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u41 = User.find_or_create_by(sca_name: "Dmitrii Volkovich") do |user|
       user.email = "pelican41@example.com"
       user.password = "MD74YOOL"
       user.modern_name = ""
    end
    u41 = User.find_for_authentication(email: "pelican41@example.com") unless u41.valid?
    unless u41.arms.attached?
      u41.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/41.gif'), filename: '41.gif', content_type: 'images/gif');
    end
    p41 = Peer.create(user: u41, type: 'Pelican', elevated_by: "Tarquin & Aibhilin", elevation_date: Date.parse("1996-03-23"), active: false, vigilant: false, bio: "")
    u42 = User.find_or_create_by(sca_name: "Dorinda Aethelwyn") do |user|
       user.email = "pelican42@example.com"
       user.password = "WK03Qs7h"
       user.modern_name = ""
    end
    u42 = User.find_for_authentication(email: "pelican42@example.com") unless u42.valid?
    p42 = Peer.create(user: u42, type: 'Pelican', elevated_by: "Tarquin the Red and Aibhilin ni Dhomnaill", elevation_date: Date.parse("1996-02-24"), active: true, vigilant: false, bio: "")
    u43 = User.find_or_create_by(sca_name: "Ealasaid nic Phearsoinn") do |user|
       user.email = "mcpherson@starband.net"
       user.password = "nK0xkw2o"
       user.modern_name = "Elspeth Christianson"
    end
    u43 = User.find_for_authentication(email: "mcpherson@starband.net") unless u43.valid?
    p43 = Peer.create(user: u43, type: 'Pelican', elevated_by: "Hugo and Caitlin", elevation_date: Date.parse("1981-05-24"), active: false, vigilant: false, bio: "")
    u44 = User.find_or_create_by(sca_name: "Elli Lutemaker") do |user|
       user.email = "Kuhfeld@aol.com"
       user.password = "dT03a2t2"
       user.modern_name = "Ellen Kuhfeld"
    end
    u44 = User.find_for_authentication(email: "Kuhfeld@aol.com") unless u44.valid?
    unless u44.arms.attached?
      u44.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/44.gif'), filename: '44.gif', content_type: 'images/gif');
    end
    p44 = Peer.create(user: u44, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    p44.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/44.png'), filename: '44.png', content_type: 'images/png');
    u45 = User.find_or_create_by(sca_name: "Elena de Vexin") do |user|
       user.email = "joann.peek@gmail.com"
       user.password = "jndwrokw"
       user.modern_name = "Joann Peek"
    end
    u45 = User.find_for_authentication(email: "joann.peek@gmail.com") unless u45.valid?
    unless u45.arms.attached?
      u45.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/45.gif'), filename: '45.gif', content_type: 'images/gif');
    end
    p45 = Peer.create(user: u45, type: 'Pelican', elevated_by: "Osis and Valthiona", elevation_date: Date.parse("1995-07-08"), active: false, vigilant: false, bio: "")
    p45.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/45.png'), filename: '45.png', content_type: 'images/png');
    u46 = User.find_or_create_by(sca_name: "Elfleda Tarsella of Bethoc") do |user|
       user.email = "TarsieF@indy.rr.com"
       user.password = "zo0mDy2W"
       user.modern_name = "Tarsie Franklin"
    end
    u46 = User.find_for_authentication(email: "TarsieF@indy.rr.com") unless u46.valid?
    unless u46.arms.attached?
      u46.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/46.gif'), filename: '46.gif', content_type: 'images/gif');
    end
    p46 = Peer.create(user: u46, type: 'Pelican', elevated_by: "Trelon and Daphne (Atenveldt)", elevation_date: Date.parse("1989-08-01"), active: true, vigilant: false, bio: "     Mistress of the Pelican 01 Aug 1989 Companion of the Fleur de Soleil 01 May 1993 Companion of the Solar Phoenix 25 Oct 1987 Companion of the Esprit de Soleil 16 Sep 1987 Companion of the Honor of Sundragon 18 Sep 1988 Companion of the Dragon's Scale 06 Oct 1991 Order of the Gilded Reed (Tirnewydd) 24 Apr 1982 Award of Arms 17 Apr 1982 Keeper of the Solar Heart 16 Nov 1991  _Proteges elevated to the Order of the Pelican:_ Master Padraig Dillon of Liath Tor Mistress Alexandra de la Varte (Cap'n Alex)  _Past offices held:_ Minister of Arts & Sciences (Barony of Sundragon) Minister of Arts & Sciences (Principality of the Sun) Keeper of the Regalia (Principality of the Sun)")
    p46.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/46.png'), filename: '46.png', content_type: 'images/png');
    u47 = User.find_or_create_by(sca_name: "Eliahu ben Itzhak") do |user|
       user.email = "DukeEliahu@gmail.com"
       user.password = "GED53HLz"
       user.modern_name = "Joseph Radding"
    end
    u47 = User.find_for_authentication(email: "DukeEliahu@gmail.com") unless u47.valid?
    unless u47.arms.attached?
      u47.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/47.gif'), filename: '47.gif', content_type: 'images/gif');
    end
    p47 = Peer.create(user: u47, type: 'Pelican', elevated_by: "Comar gyr Mirand and Lisa Dolorosa", elevation_date: Date.parse("1990-06-16"), active: true, vigilant: false, bio: "     Duke Count Knight of the Society Master of the Pelican Baron of the Court Order of the Dragon\'s Heart Order of the Willow Order of the Dragon\'s Tooth (x3) Order of the Royal Vanguard Award of the Purple Fret Award of the Queen\'s Favor Award of the Doe\'s Grace (x3) Award of the Sapphire Kingdom Augmentation of Arms Friend of the Trillium (Ealdormere) Award of the Silver Chalice (Roaring Wastes) Award of the Elephant\'s Heart (Cynnabar) Award of the Gold Comet (Debatable Lands, AEthelmearc)")
    p47.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/47.png'), filename: '47.png', content_type: 'images/png');
    u48 = User.find_or_create_by(sca_name: "Enid Aurelia of the Tin Isles") do |user|
       user.email = "pelican48@example.com"
       user.password = "wKD7drSu"
       user.modern_name = ""
    end
    u48 = User.find_for_authentication(email: "pelican48@example.com") unless u48.valid?
    p48 = Peer.create(user: u48, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u49 = User.find_or_create_by(sca_name: "Erik Erikson") do |user|
       user.email = "ernieh@siscom.net"
       user.password = "cMe1S32M"
       user.modern_name = "Ernie Husted Jr."
    end
    u49 = User.find_for_authentication(email: "ernieh@siscom.net") unless u49.valid?
    unless u49.arms.attached?
      u49.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/49.gif'), filename: '49.gif', content_type: 'images/gif');
    end
    p49 = Peer.create(user: u49, type: 'Pelican', elevated_by: "Edmund of Hertford and Katryn Bronwyn of Glouchester", elevation_date: Date.parse("1997-08-14"), active: true, vigilant: false, bio: "")
    u50 = User.find_or_create_by(sca_name: "Etaoin O'Fearghail") do |user|
       user.email = "pelican50@example.com"
       user.deceased = true,
       user.password = "Y5jFyQqP"
       user.modern_name = ""
    end
    u50 = User.find_for_authentication(email: "pelican50@example.com") unless u50.valid?
    p50 = Peer.create(user: u50, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u51 = User.find_or_create_by(sca_name: "Finnvarr de Taahe") do |user|
       user.email = "steve.muhlberger@gmail.com"
       user.password = "6MiVP4zE"
       user.modern_name = "Steve Muhlberger"
    end
    u51 = User.find_for_authentication(email: "steve.muhlberger@gmail.com") unless u51.valid?
    p51 = Peer.create(user: u51, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u52 = User.find_or_create_by(sca_name: "Fiona Averylle O'Connor of Maidenhead") do |user|
       user.email = "pelican52@example.com"
       user.deceased = true,
       user.password = "MPG3v5ss"
       user.modern_name = ""
    end
    u52 = User.find_for_authentication(email: "pelican52@example.com") unless u52.valid?
    unless u52.arms.attached?
      u52.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/52.gif'), filename: '52.gif', content_type: 'images/gif');
    end
    p52 = Peer.create(user: u52, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "I have no other image of her arms than this, though she had received a kingdom Augmentation from Dag of a gold ring, which she centered in the chief, and a quartering, which she wore in spite of the college of heralds (She had been Dragon Herald, and as such did not dispute the wisdom or wishes of the Crown) wherein her arms were quartered with a Midrealm pale with a Dragon Rampant maintaining a gold trumpet. 

She was also founding Baroness (Along with Baron Byron) of the Barony of Rising Waters, now in the Kingdom of Ealdormere, and was granted the title of White Mantle Herald Extraordinaire (a lifetime honor). 

 His Grace Talymar, speaking at her funeral, said that as long as you speak the name of loved ones and honor their memory, they are never truly gone.  Thank you for reading my words on Fiona, whom I loved, and still love, beyond words.   Warmest Regards, and Many Thanks, -Contessa Tamara")
    p52.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/52.png'), filename: '52.png', content_type: 'images/png');
    u53 = User.find_or_create_by(sca_name: "Foscadh O'Dubhda") do |user|
       user.email = "pelican53@example.com"
       user.password = "O3C9DIZN"
       user.modern_name = ""
    end
    u53 = User.find_for_authentication(email: "pelican53@example.com") unless u53.valid?
    p53 = Peer.create(user: u53, type: 'Pelican', elevated_by: "Tarquin the Red and Aibhilin ni Dhomnaill", elevation_date: Date.parse("1996-03-09"), active: true, vigilant: false, bio: "")
    u54 = User.find_or_create_by(sca_name: "Frederic L'Avarre") do |user|
       user.email = "pelican54@example.com"
       user.password = "5gdj7dNK"
       user.modern_name = ""
    end
    u54 = User.find_for_authentication(email: "pelican54@example.com") unless u54.valid?
    p54 = Peer.create(user: u54, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u55 = User.find_or_create_by(sca_name: "Gareth Tancred Wilfrith") do |user|
       user.email = "pelican55@example.com"
       user.password = "wNzlqgok"
       user.modern_name = ""
    end
    u55 = User.find_for_authentication(email: "pelican55@example.com") unless u55.valid?
    p55 = Peer.create(user: u55, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u56 = User.find_or_create_by(sca_name: "Garlanda de Stanas") do |user|
       user.email = "kstets@excite.com"
       user.password = "mDcj1hWB"
       user.modern_name = "Kellene M. Stets"
    end
    u56 = User.find_for_authentication(email: "kstets@excite.com") unless u56.valid?
    unless u56.arms.attached?
      u56.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/56.gif'), filename: '56.gif', content_type: 'images/gif');
    end
    p56 = Peer.create(user: u56, type: 'Pelican', elevated_by: "Thorbjorn Osis and Caitlin Stuart", elevation_date: Date.parse("1997-02-22"), active: true, vigilant: false, bio: "")
    u57 = User.find_or_create_by(sca_name: "Genevieve du Vent Argent") do |user|
       user.email = "grnjenny@gmail.com"
       user.password = "cZ02n0Yb"
       user.modern_name = ""
    end
    u57 = User.find_for_authentication(email: "grnjenny@gmail.com") unless u57.valid?
    p57 = Peer.create(user: u57, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u58 = User.find_or_create_by(sca_name: "Geoffrey of Warwick") do |user|
       user.email = "geoffreyofwarwick@gmail.com"
       user.password = "KJlf2XO1"
       user.modern_name = "Jeff Schmitz"
    end
    u58 = User.find_for_authentication(email: "geoffreyofwarwick@gmail.com") unless u58.valid?
    p58 = Peer.create(user: u58, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 7/8/95 by Thorbjorn Osis Brandsson and Valthjona Cuthbert")
    u59 = User.find_or_create_by(sca_name: "Margherita Alessia") do |user|
       user.email = "suzanearley@comcast.net"
       user.password = "cXlOd0ml"
       user.modern_name = "Susan Earley"
    end
    u59 = User.find_for_authentication(email: "suzanearley@comcast.net") unless u59.valid?
    p59 = Peer.create(user: u59, type: 'Pelican', elevated_by: "Finn II and Garlanda II", elevation_date: Date.parse("1994-08-18"), active: true, vigilant: false, bio: "    Purple Fret 30 May 2009 (A.S. 44) 

    Order of the Pelican 18 Aug, 1994 (A.S. 29) Grant of Arms 03 Apr, 1993 (A.S. 27) Order of the Willow 24 Jun, 1989 (A.S. 24) Award of Arms 10 May, 1986 (A.S. 21)")
    u60 = User.find_or_create_by(sca_name: "Giles Devon") do |user|
       user.email = "horsebows@mail.madtown.net"
       user.password = "Ft7dqSVj"
       user.modern_name = "Ed Gilbert"
    end
    u60 = User.find_for_authentication(email: "horsebows@mail.madtown.net") unless u60.valid?
    p60 = Peer.create(user: u60, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 9/28/96 by Edmund of Hertford and Katryn Bronwyn of Glouchester")
    u61 = User.find_or_create_by(sca_name: "GraziaGeralda Louisa de Navarra") do |user|
       user.email = "graziageralda@gmail.com"
       user.password = "ycxiFhTO"
       user.modern_name = ""
    end
    u61 = User.find_for_authentication(email: "graziageralda@gmail.com") unless u61.valid?
    p61 = Peer.create(user: u61, type: 'Pelican', elevated_by: "Bronnos and Rebecka", elevation_date: Date.parse("1994-10-15"), active: true, vigilant: false, bio: "")
    u62 = User.find_or_create_by(sca_name: "Graidhne ni Ruaidh") do |user|
       user.email = "pelican62@example.com"
       user.password = "wvfAi7Kc"
       user.modern_name = ""
    end
    u62 = User.find_for_authentication(email: "pelican62@example.com") unless u62.valid?
    p62 = Peer.create(user: u62, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u63 = User.find_or_create_by(sca_name: "Gwennan o'r Afon Rhedeg") do |user|
       user.email = "pelican63@example.com"
       user.password = "gZ3f38dv"
       user.modern_name = ""
    end
    u63 = User.find_for_authentication(email: "pelican63@example.com") unless u63.valid?
    p63 = Peer.create(user: u63, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u64 = User.find_or_create_by(sca_name: "Gwyneth Felton") do |user|
       user.email = "gwyneth1362@hotmail.com"
       user.password = "aA6YlvfZ"
       user.modern_name = "Linda S. Moore"
    end
    u64 = User.find_for_authentication(email: "gwyneth1362@hotmail.com") unless u64.valid?
    unless u64.arms.attached?
      u64.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/64.gif'), filename: '64.gif', content_type: 'images/gif');
    end
    p64 = Peer.create(user: u64, type: 'Pelican', elevated_by: "Dag and Elayna", elevation_date: Date.parse("1999-03-20"), active: false, vigilant: false, bio: "")
    p64.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/64.png'), filename: '64.png', content_type: 'images/png');
    u65 = User.find_or_create_by(sca_name: "Hector of the Black Height") do |user|
       user.email = "pelican65@example.com"
       user.password = "EAX5GBxR"
       user.modern_name = ""
    end
    u65 = User.find_for_authentication(email: "pelican65@example.com") unless u65.valid?
    p65 = Peer.create(user: u65, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    p65.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/65.png'), filename: '65.png', content_type: 'images/png');
    u66 = User.find_or_create_by(sca_name: "Henry of Linlithgow") do |user|
       user.email = "pelican66@example.com"
       user.password = "cLnvdYiI"
       user.modern_name = ""
    end
    u66 = User.find_for_authentication(email: "pelican66@example.com") unless u66.valid?
    p66 = Peer.create(user: u66, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u67 = User.find_or_create_by(sca_name: "Ilyana Ekaterina Yosipovna") do |user|
       user.email = "cathe219@yahoo.com"
       user.password = "7JEN1esR"
       user.modern_name = "Catherine Oyler"
    end
    u67 = User.find_for_authentication(email: "cathe219@yahoo.com") unless u67.valid?
    p67 = Peer.create(user: u67, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1998-08-13"), active: true, vigilant: false, bio: "")
    p67.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/67.png'), filename: '67.png', content_type: 'images/png');
    u68 = User.find_or_create_by(sca_name: "Ithriliel of Silver Lake") do |user|
       user.email = "pelican68@example.com"
       user.password = "tBP3lREY"
       user.modern_name = ""
    end
    u68 = User.find_for_authentication(email: "pelican68@example.com") unless u68.valid?
    p68 = Peer.create(user: u68, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u69 = User.find_or_create_by(sca_name: "Jafar al-Safa") do |user|
       user.email = "pelican69@example.com"
       user.deceased = true,
       user.password = "ykcIjHob"
       user.modern_name = ""
    end
    u69 = User.find_for_authentication(email: "pelican69@example.com") unless u69.valid?
    p69 = Peer.create(user: u69, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u70 = User.find_or_create_by(sca_name: "Jhondo Oakenshield") do |user|
       user.email = "dances.with.beers@gmail.com"
       user.password = "0H8JABCQ"
       user.modern_name = "Dave Erickson"
    end
    u70 = User.find_for_authentication(email: "dances.with.beers@gmail.com") unless u70.valid?
    p70 = Peer.create(user: u70, type: 'Pelican', elevated_by: "Edmund of Hertford and Katryn Bronwyn of Glouchester", elevation_date: Date.parse("1996-06-22"), active: true, vigilant: false, bio: "")
    p70.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/70.png'), filename: '70.png', content_type: 'images/png');
    u71 = User.find_or_create_by(sca_name: "John ap Wynne") do |user|
       user.email = "johnapwynne@aol.com"
       user.password = "79jqBlqZ"
       user.modern_name = "Michael Wynne Wright"
    end
    u71 = User.find_for_authentication(email: "johnapwynne@aol.com") unless u71.valid?
    p71 = Peer.create(user: u71, type: 'Pelican', elevated_by: "Thorbjorn Osis Brandsson and Valthjona Cuthbert", elevation_date: Date.parse("1995-08-16"), active: true, vigilant: false, bio: "")
    u72 = User.find_or_create_by(sca_name: "John of Sternfeld") do |user|
       user.email = "jos3@indy.rr.com"
       user.password = "XFNlI4Hb"
       user.modern_name = "John Elmore"
    end
    u72 = User.find_for_authentication(email: "jos3@indy.rr.com") unless u72.valid?
    p72 = Peer.create(user: u72, type: 'Pelican', elevated_by: "Jafar & Catherine de la Rose", elevation_date: Date.parse("1994-05-14"), active: true, vigilant: false, bio: "")
    u73 = User.find_or_create_by(sca_name: "Kaellyn mac Dermott of Leinster") do |user|
       user.email = "pelican73@example.com"
       user.password = "zeRmaVHq"
       user.modern_name = ""
    end
    u73 = User.find_for_authentication(email: "pelican73@example.com") unless u73.valid?
    p73 = Peer.create(user: u73, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u74 = User.find_or_create_by(sca_name: "Karl Aerdigwidder von Zauberberg") do |user|
       user.email = "pelican74@example.com"
       user.password = "NPOf17IG"
       user.modern_name = ""
    end
    u74 = User.find_for_authentication(email: "pelican74@example.com") unless u74.valid?
    p74 = Peer.create(user: u74, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u75 = User.find_or_create_by(sca_name: "Karl Ulfson") do |user|
       user.email = "knox@grendel.astr.cwru.edu"
       user.password = "G8xEPjE1"
       user.modern_name = "Charles Knox"
    end
    u75 = User.find_for_authentication(email: "knox@grendel.astr.cwru.edu") unless u75.valid?
    unless u75.arms.attached?
      u75.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/75.gif'), filename: '75.gif', content_type: 'images/gif');
    end
    p75 = Peer.create(user: u75, type: 'Pelican', elevated_by: "Eliahu and Elen", elevation_date: Date.parse("1984-08-18"), active: true, vigilant: false, bio: "Elevated at Great Court at Pennsic XIII by Eliahu and Elen")
    p75.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/75.png'), filename: '75.png', content_type: 'images/png');
    u76 = User.find_or_create_by(sca_name: "Katerina de Turenne") do |user|
       user.email = "pelican76@example.com"
       user.password = "cncMpsHp"
       user.modern_name = ""
    end
    u76 = User.find_for_authentication(email: "pelican76@example.com") unless u76.valid?
    p76 = Peer.create(user: u76, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u77 = User.find_or_create_by(sca_name: "Katharina von der Waldwiese") do |user|
       user.email = "sreeseman@hotmail.com"
       user.password = "3tIbLJb5"
       user.modern_name = "Sarah Reeseman"
    end
    u77 = User.find_for_authentication(email: "sreeseman@hotmail.com") unless u77.valid?
    unless u77.arms.attached?
      u77.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/77.gif'), filename: '77.gif', content_type: 'images/gif');
    end
    p77 = Peer.create(user: u77, type: 'Pelican', elevated_by: "Palymar III and Aislinn", elevation_date: Date.parse("1998-02-07"), active: true, vigilant: false, bio: "Katharina is a late 14th Century Prussian noblewoman married off to an English knight as a tourney ransom. She was actually relieved for a change of scenery and spends her time touring the continent and the isles with her beloved husband (Viscount Myles Blackheath, KSCA, OP) on the tournament circuit. She has a love of armored combat, rapier combat, seige weapons & archery. In the Society, Katharina is active in the marshallate and enjoys a wide variety of arts and sciences especially: medieval medicine, costuming, historical research, counted thread needlework, music, and illumination.

Sarah Reeseman works as an Technical Support Consultant in Cincinnati, OH, and actively participates in voluteer activites for American Cancer Sociey, Susan B. Komen Foundation and more. She is also an retired officer who served in Ohio Military Reserve as a Military Police and Civial Support as in leadership roles, as the Brigade Web Supervisor/IT Officer, and as the Brigade Public Affairs Officer.")
    p77.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/77.png'), filename: '77.png', content_type: 'images/png');
    u78 = User.find_or_create_by(sca_name: "Emeludt HÃ¤nsler") do |user|
       user.email = "happy.emmie@gmail.com"
       user.password = "x5nSsoDu"
       user.modern_name = "Emmie Smith"
    end
    u78 = User.find_for_authentication(email: "happy.emmie@gmail.com") unless u78.valid?
    p78 = Peer.create(user: u78, type: 'Pelican', elevated_by: "Christoph I & Adelhait I", elevation_date: Date.parse("2016-03-26"), active: false, vigilant: false, bio: "")
    p78.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/340.png'), filename: '340.png', content_type: 'images/png');
    u79 = User.find_or_create_by(sca_name: "Katherine of Sternfeld") do |user|
       user.email = "kritchie@readerlink.com"
       user.password = "EPrjGN2q"
       user.modern_name = "Katherine Ritchie"
    end
    u79 = User.find_for_authentication(email: "kritchie@readerlink.com") unless u79.valid?
    p79 = Peer.create(user: u79, type: 'Pelican', elevated_by: "Comar & Lisa", elevation_date: Date.parse("1992-01-15"), active: true, vigilant: false, bio: "Proteged to: Mistress Claire Fitzwilliam of Lynwood Keep  
 Elevated by: Comar and Lisa January 11, 1992")
    p79.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/78.png'), filename: '78.png', content_type: 'images/png');
    u80 = User.find_or_create_by(sca_name: "Kay of Tre Asterium") do |user|
       user.email = "kjarrell@gmail.com"
       user.password = "WLxR5JnN"
       user.modern_name = "D. Kay Jarrell"
    end
    u80 = User.find_for_authentication(email: "kjarrell@gmail.com") unless u80.valid?
    p80 = Peer.create(user: u80, type: 'Pelican', elevated_by: "Dag and Elayna", elevation_date: Date.parse("1998-09-19"), active: true, vigilant: false, bio: "A long and strange career, indeed! Kay of Tre Asterium arrived in the Society in The Barony of the Northwoods in October of AS 8. The greatest learning experience on the long road to being \*believed by others\* to be worth to be called a Pelican was realizing that Everything is more fun if you Help make it happen!

This is still true as I get active in Atlantia, where I will be TDY for the next 5 or so years.")
    p80.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/79.png'), filename: '79.png', content_type: 'images/png');
    u81 = User.find_or_create_by(sca_name: "Kirsten Thorsteinsdottir") do |user|
       user.email = "kirstendjh@hotmail.com"
       user.password = "2hbmD5E3"
       user.modern_name = "Donna Herum"
    end
    u81 = User.find_for_authentication(email: "kirstendjh@hotmail.com") unless u81.valid?
    unless u81.arms.attached?
      u81.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/80.gif'), filename: '80.gif', content_type: 'images/gif');
    end
    p81 = Peer.create(user: u81, type: 'Pelican', elevated_by: "Kenna", elevation_date: Date.parse("1998-09-19"), active: true, vigilant: false, bio: "")
    p81.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/80.png'), filename: '80.png', content_type: 'images/png');
    u82 = User.find_or_create_by(sca_name: "Laurelen Darksbane") do |user|
       user.email = "pelican82@example.com"
       user.password = "xmgfEilH"
       user.modern_name = ""
    end
    u82 = User.find_for_authentication(email: "pelican82@example.com") unless u82.valid?
    p82 = Peer.create(user: u82, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1983-10-15"), active: true, vigilant: false, bio: "")
    p82.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/81.png'), filename: '81.png', content_type: 'images/png');
    u83 = User.find_or_create_by(sca_name: "Leanore de Vertearbors") do |user|
       user.email = "elliepeli@aol.com"
       user.password = "XrjyWqce"
       user.modern_name = "Eleanor Wright"
    end
    u83 = User.find_for_authentication(email: "elliepeli@aol.com") unless u83.valid?
    p83 = Peer.create(user: u83, type: 'Pelican', elevated_by: "Dag  and Ilsa", elevation_date: Date.parse("1993-08-21"), active: true, vigilant: false, bio: "")
    u84 = User.find_or_create_by(sca_name: "Lewys Michael Patrick Blackmore") do |user|
       user.email = "lewys.blackmore@gmail.com"
       user.password = "fnNPqh4M"
       user.modern_name = "Patrick A. Giese"
    end
    u84 = User.find_for_authentication(email: "lewys.blackmore@gmail.com") unless u84.valid?
    unless u84.arms.attached?
      u84.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/83.gif'), filename: '83.gif', content_type: 'images/gif');
    end
    p84 = Peer.create(user: u84, type: 'Pelican', elevated_by: "HRM Kenna Harve", elevation_date: Date.parse("1998-08-14"), active: false, vigilant: false, bio: "**_Motto: Audentes fortuna juvat (Fortune favors the bold) _**

Poor Lewys\' Requirements for recommending someone as a Pelican candidate

All of these factor into my consideration of someone as a potential member of this order. Not all are equally weighted, nor equally important, and listed in no particular order:

They show reasonable and informed respect for the governance of kingdom and the Society, and show due respect for the Crowns of the Kingdom and those who hold the lands in fee.

As they serve in offices, they should do something to improve that office - leave it better than they found it. Demonstrate equanimity while in office, showing that they recognize that serving in office is exactly that, serving, not a status enhancement or a way to garner awards or recognition.

They are obvious in their demonstration of courtesy and noble behavior, and strive to be as authentically period for their persona as they can afford to be.

They lead, by example or by influence or persuasion. They are capable of handling challenging situations coolly and equitably.

They encourage others in service, by sharing knowledge, by training, by providing supported opportunities for others to grow into service roles as well.

When confronted with a serious challenge or worse, failure, they own responsibility for their part of it, look for the correct solution, apologize where needed and make any necessary course or personal correction to address it effectively. They accept criticism gracefully and thoughtfully.

They are someone who\'s company I enjoy, and who understands the basics of hospitality.

They are reasonably well-rounded as a noble of the Middle Ages - and a denizen of a civilized court. Ideally with some knowledge of period literature, dancing, music, heraldry and some familiarity with combat as practiced in the Society.

And finally, there is an indefinable something, a touch or feel to them that says they have a clue. That all of the above fits them like a second skin. They get it. I can€™t really quantify this readily, but I know it when I see it and experience it.")
    p84.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/83.png'), filename: '83.png', content_type: 'images/png');
    u85 = User.find_or_create_by(sca_name: "Lisa Dolorosa") do |user|
       user.email = "lisaely@ix.netcom.com"
       user.password = "vhjWZuJ6"
       user.modern_name = "Lisa Ely"
    end
    u85 = User.find_for_authentication(email: "lisaely@ix.netcom.com") unless u85.valid?
    p85 = Peer.create(user: u85, type: 'Pelican', elevated_by: "Thorbjorn Osis Brandsson and Caitlin Stuart", elevation_date: Date.parse("1997-02-01"), active: true, vigilant: false, bio: "")
    p85.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/84.png'), filename: '84.png', content_type: 'images/png');
    u86 = User.find_or_create_by(sca_name: "Lucas Otto Gustav Oswald Stephen vom Schnecke") do |user|
       user.email = "pelican86@example.com"
       user.password = "ewwB0pRy"
       user.modern_name = ""
    end
    u86 = User.find_for_authentication(email: "pelican86@example.com") unless u86.valid?
    unless u86.arms.attached?
      u86.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/85.gif'), filename: '85.gif', content_type: 'images/gif');
    end
    p86 = Peer.create(user: u86, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1988-08-20"), active: true, vigilant: false, bio: "Sir LOGOS  
(Lucas Otto Gustaf Oswald Stephan vom Schnecke)  
\"Thousands of guys died figuring this out — show it some respect\"  
  
**Date of Elevation:**  
20 August, 1988 (A.S. 23)

 

**Other Middle Kingdom Awards:**  
Award of Arms — 17 Dec, 1977 (A.S. 12)  
Order of Chivalry — Knight — 29 Oct, 1983 (A.S. 18)  
Grant of Arms — 25 May, 1986 (A.S. 21)  
Order of the Dragon's Heart — 24 Oct, 1987 (A.S. 22)

Order of the Pelican — 20 Aug, 1988 (A.S. 23)

Order of the Bronze Ring – 04 March, 2000 (A.S. 34)

Order of Defense - o4 July, 2015 (AS 50)

Kings Chalice - 25 March, 2017 (A.S. 51)

Order of the Laurel - 20 January, 2018 (A.S 52)

Royal Vanguard - 28 September, 2019 (A.S. 54)

**Classes Offered:**  
Fabris

 

Introduction to Italian Rapier

 

Feints and Invitations

 

Cloak and Rapier

 

Rotello and Sword  
Bolognese Sword

 The Four Fights of Silver  
Dussack  
Body Mechanics  
Late-period Costuming & Accessories  
Late-period Fortification Science  
Fast-and-dirty Latchet Shoes  
The Renaissance War Galley  
(and too many more to list)  
  
**Location:**  
Midlands   
  
**About Sir LOGOS:**  
Sir LOGOS was born in Die Pfalz near Neckersteineck. He traveled extensively and fought in many campaigns on the continent. He studied under many masters, but primarily Hans Wilhem Stoffer von Dietz of Marburg who studied under Fabris. Tim Lyon is a technical writer with too many expensive hobbies including sailing, riding, and single malt scotch.")
    p86.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/85.png'), filename: '85.png', content_type: 'images/png');
    u87 = User.find_or_create_by(sca_name: "Mairin of the East Isles") do |user|
       user.email = "pelican87@example.com"
       user.password = "Ck1YKtPz"
       user.modern_name = ""
    end
    u87 = User.find_for_authentication(email: "pelican87@example.com") unless u87.valid?
    p87 = Peer.create(user: u87, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u88 = User.find_or_create_by(sca_name: "Margaret Malise of Kyrkyntolaghe") do |user|
       user.email = "pelican88@example.com"
       user.password = "PxOASPXN"
       user.modern_name = ""
    end
    u88 = User.find_for_authentication(email: "pelican88@example.com") unless u88.valid?
    p88 = Peer.create(user: u88, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u89 = User.find_or_create_by(sca_name: "Maria Teresa Ribeiro dos Santos") do |user|
       user.email = "steinmaria@comcast.net"
       user.password = "5IJwQOOs"
       user.modern_name = "Jane L. Crowley"
    end
    u89 = User.find_for_authentication(email: "steinmaria@comcast.net") unless u89.valid?
    p89 = Peer.create(user: u89, type: 'Pelican', elevated_by: "Osis and Valthiona", elevation_date: Date.parse("1995-05-27"), active: true, vigilant: false, bio: "")
    p89.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/88.png'), filename: '88.png', content_type: 'images/png');
    u90 = User.find_or_create_by(sca_name: "Melchior Stoneteeth") do |user|
       user.email = "melkords@gmail.com"
       user.password = "5dPvm0UH"
       user.modern_name = "Bruce Groseclose"
    end
    u90 = User.find_for_authentication(email: "melkords@gmail.com") unless u90.valid?
    unless u90.arms.attached?
      u90.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/89.gif'), filename: '89.gif', content_type: 'images/gif');
    end
    p90 = Peer.create(user: u90, type: 'Pelican', elevated_by: "Finn & Garlanda", elevation_date: Date.parse("1994-08-18"), active: true, vigilant: false, bio: "")
    p90.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/89.png'), filename: '89.png', content_type: 'images/png');
    u91 = User.find_or_create_by(sca_name: "Melisande de Marmande") do |user|
       user.email = "jcjohnson8.1950@gmail.com"
       user.password = "gFV5sqb5"
       user.modern_name = "Jeanne Johnson"
    end
    u91 = User.find_for_authentication(email: "jcjohnson8.1950@gmail.com") unless u91.valid?
    p91 = Peer.create(user: u91, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1992-03-07"), active: true, vigilant: false, bio: "")
    p91.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/90.png'), filename: '90.png', content_type: 'images/png');
    u92 = User.find_or_create_by(sca_name: "Melisande of Woodcrest") do |user|
       user.email = "melisande@charter.net"
       user.password = "PfBIE8Dq"
       user.modern_name = "Cathy Akers-Jordan"
    end
    u92 = User.find_for_authentication(email: "melisande@charter.net") unless u92.valid?
    unless u92.arms.attached?
      u92.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/91.gif'), filename: '91.gif', content_type: 'images/gif');
    end
    p92 = Peer.create(user: u92, type: 'Pelican', elevated_by: "Palymar and Aislinn", elevation_date: Date.parse("1998-01-10"), active: true, vigilant: false, bio: "Arms: Per pale purpure and sable, a greyhound courant within an orle of fleurs-de-lys argent.  
  
 Motto: Veritas vincent omnia (Truth overcomes all obstacles).  
  
Persona

Melisande is a 12th century Anglo-Norman lady who joined the SCA about 1983 and has been an active member ever since. She is apprenticed to Master Thaddeus the Brown and Mistress Siobhan O'Neill. Her love of Medieval and Arthurian Literature led to her interest in the SCA where she enjoys music, greyhounds, and spending time with her friends from all over the Middle Kingdom. She is skilled in embroidery, research, calligraphy, cooking, juggling and costuming, and interested in tablet weaving. She is a patroness of Arthurian literature and the new art of courtly love.   
   
 Melisande has been the local, regional, and Kingdom Minister of Arts and Sciences, regional Seneschal, and has been on Pennsic staff twice. She became a Mistress of Pelican Jan. 10, 1998 and her proteges are Master Hroar Stormengr, THL Bronwyn of Brighoaks, and THL Eoin O'Seaghda.   
   
 SCA Awards

| [Order of the Pelican](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=7) | [10 Jan, 1998](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1998&mon=01&day=10) (A.S. 32) |
| [Order of the Dragon's Heart](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=13) | [30 Mar, 1996](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1996&mon=03&day=30) (A.S. 30) |
| [Grant of Arms](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=10) | [06 May, 1995](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1995&mon=05&day=06) (A.S. 30) |
| [Order of the Willow](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=15) | [28 Apr, 1990](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1990&mon=04&day=28) (A.S. 24) |
| [Award of the Doe's Grace](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=20) | [15 Jan, 1994](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1994&mon=01&day=15) (A.S. 28) |
| [Award of Arms](http://www.midrealm.org/op/op.phtml?searchvar=byhonor&input2=27) | [07 Nov, 1987](http://www.midrealm.org/op/op.phtml?searchvar=bydate&yer=1987&mon=11&day=07) (A.S. 22) |
 

Mundane Info  
   
 Mundanely, Cathy is a writing instructor at the University of Michigan-Flint where she teaches freshman composition, technical writing, and business communication, among other things. Her most recent publication is \"Fairy Princess or Tragic Heroine? The Metamorphosis of Arwen Undomiel in Peter Jackson's Lord of the Rings Films.\" [Tolkien on Film: Essays on Peter Jackson's Lord of the Rings](http://www.amazon.com/gp/product/1887726098/qid=1100735636/sr=1-1/ref=sr_1_1/102-9801555-4180931?s=books&v=glance&n=283155). Janet B. Croft, ed. San Francisco: [Mythopoeic Press](http://www.mythsoc.org/croft.html), 2004.   
   
 Cathy is married to Roger Jordan (THL Balian de Brionne) and they live in Davison with their cats. When she's not busy with work or the SCA, Cathy enjoys reading murder mysteries and visiting museums (especially any exhibits that relate to Ancient Egypt, the Middle Ages, or the Titanic).

Visit her [SCA Web Site](http://spruce.flint.umich.edu/~cakers/Mel/Mel.html) (like this but with more pictures), [Mundane Web Site](http://spruce.umflint.edu/~cakers/) (University of Michigan-Flint) or [Blog](http://citadelofstars.blogspot.com/).

* * *
Updated Feb. 27, 2006.")
    p92.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/91.png'), filename: '91.png', content_type: 'images/png');
    u93 = User.find_or_create_by(sca_name: "Menken Brechen") do |user|
       user.email = "pelican93@example.com"
       user.password = "MqxVKmMs"
       user.modern_name = ""
    end
    u93 = User.find_for_authentication(email: "pelican93@example.com") unless u93.valid?
    p93 = Peer.create(user: u93, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u94 = User.find_or_create_by(sca_name: "Meriel de Blackwoode") do |user|
       user.email = "jmhughes@consolidated.net"
       user.password = "CSouPFus"
       user.modern_name = "Jeri Matteson-Hughes"
    end
    u94 = User.find_for_authentication(email: "jmhughes@consolidated.net") unless u94.valid?
    unless u94.arms.attached?
      u94.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/93.gif'), filename: '93.gif', content_type: 'images/gif');
    end
    p94 = Peer.create(user: u94, type: 'Pelican', elevated_by: "Palymar & Katherine I", elevation_date: Date.parse("1986-08-16"), active: true, vigilant: false, bio: "")
    p94.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/93.png'), filename: '93.png', content_type: 'images/png');
    u95 = User.find_or_create_by(sca_name: "Merlume de Lunecorne of Narwhale Keep") do |user|
       user.email = "pelican95@example.com"
       user.password = "zGEfNrtF"
       user.modern_name = ""
    end
    u95 = User.find_for_authentication(email: "pelican95@example.com") unless u95.valid?
    p95 = Peer.create(user: u95, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1988-08-20"), active: false, vigilant: false, bio: "")
    u96 = User.find_or_create_by(sca_name: "Minna von Lubeck") do |user|
       user.email = "crispinbucher@att.net"
       user.password = "YlZnAaxI"
       user.modern_name = ""
    end
    u96 = User.find_for_authentication(email: "crispinbucher@att.net") unless u96.valid?
    p96 = Peer.create(user: u96, type: 'Pelican', elevated_by: "Brannos O'longardail and Rebekah MacTiernan", elevation_date: Date.parse("1994-10-15"), active: true, vigilant: false, bio: "")
    p96.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/95.png'), filename: '95.png', content_type: 'images/png');
    u97 = User.find_or_create_by(sca_name: "Moonwulf Starkaaderson") do |user|
       user.email = "mlongcor01@gmail.com"
       user.password = "vnEvS0Yr"
       user.modern_name = "Michael Longcor"
    end
    u97 = User.find_for_authentication(email: "mlongcor01@gmail.com") unless u97.valid?
    unless u97.arms.attached?
      u97.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/96.gif'), filename: '96.gif', content_type: 'images/gif');
    end
    p97 = Peer.create(user: u97, type: 'Pelican', elevated_by: "Corin and Myfanwy", elevation_date: Date.parse("1985-05-04"), active: true, vigilant: false, bio: "")
    p97.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/96.png'), filename: '96.png', content_type: 'images/png');
    u98 = User.find_or_create_by(sca_name: "Moria the Black") do |user|
       user.email = "pelican98@example.com"
       user.password = "WqxECazG"
       user.modern_name = ""
    end
    u98 = User.find_for_authentication(email: "pelican98@example.com") unless u98.valid?
    p98 = Peer.create(user: u98, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u99 = User.find_or_create_by(sca_name: "Myfanwy ferch Ellis") do |user|
       user.email = "pelican99@example.com"
       user.password = "VVYABY5t"
       user.modern_name = ""
    end
    u99 = User.find_for_authentication(email: "pelican99@example.com") unless u99.valid?
    p99 = Peer.create(user: u99, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 11/15/94 by Brannos O'longardail and Rebekah MacTiernan")
    u100 = User.find_or_create_by(sca_name: "Omarad the Wary") do |user|
       user.email = "siromarad@gmail.com"
       user.password = "VMYE2JIE"
       user.modern_name = "Paul Newton II"
    end
    u100 = User.find_for_authentication(email: "siromarad@gmail.com") unless u100.valid?
    unless u100.arms.attached?
      u100.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/246.gif'), filename: '246.gif', content_type: 'images/gif');
    end
    p100 = Peer.create(user: u100, type: 'Pelican', elevated_by: "Palymar and Aislinn", elevation_date: Date.parse("2008-04-12"), active: true, vigilant: false, bio: "    Order of Chivalry – Knight
    19 Aug, 1995 (A.S. 30) 
    Court Baron / Baroness
    27 Jun, 1998 (A.S. 33)
    Grant of Arms
    07 Feb, 1998 (A.S. 32)
    Order of the Willow
    24 Feb, 1996 (A.S. 30)
    Award of the Purple Fret
    01 Feb, 1992 (A.S. 26) 
    Order of the Dragon's Tooth
    16 Aug, 1992 (A.S. 27)
    Order of the Red Company
    18 Aug, 1994 (A.S. 29)
    Order of the Dragon's Tooth
    01 Feb, 2003 (A.S. 37)
    Award of Arms
    12 Dec, 1987 (A.S. 22)
    Royal Augmentation of Arms
    05 Feb, 2005 (A.S. 39)")
    p100.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/246.png'), filename: '246.png', content_type: 'images/png');
    u101 = User.find_or_create_by(sca_name: "Palymar of the Two Baronies") do |user|
       user.email = "palymar@att.net"
       user.password = "OcMI9p40"
       user.modern_name = "Reed Harrig"
    end
    u101 = User.find_for_authentication(email: "palymar@att.net") unless u101.valid?
    unless u101.arms.attached?
      u101.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/100.gif'), filename: '100.gif', content_type: 'images/gif');
    end
    p101 = Peer.create(user: u101, type: 'Pelican', elevated_by: "HRM Kenna Harve", elevation_date: Date.parse("1998-08-14"), active: true, vigilant: false, bio: "Ducal 891007b01  
 County 861004.01  
 KSCA 870117  
 GOA 910105.01  
 ODH 920725.14  
 ODB 900512a13  
 ODT 910928.19  
 OCK 930508a08  
 AOA 850504  
 ORV 931002a29  
 OP 980814a3  
 OPF 980725.17

King's Champion - Corin du Soleil II  
 Archery Champion - Tadashi and Ariake  
 Earl Marshall - Oct 90 to Oct 92")
    p101.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/100.png'), filename: '100.png', content_type: 'images/png');
    u102 = User.find_or_create_by(sca_name: "Polidore Haraldsson of the Dented Helm") do |user|
       user.email = "pelican102@example.com"
       user.password = "Nn9nhicr"
       user.modern_name = ""
    end
    u102 = User.find_for_authentication(email: "pelican102@example.com") unless u102.valid?
    p102 = Peer.create(user: u102, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u103 = User.find_or_create_by(sca_name: "Ragni Dzintara of Amberhall") do |user|
       user.email = "pelican103@example.com"
       user.password = "wIvaKzFF"
       user.modern_name = ""
    end
    u103 = User.find_for_authentication(email: "pelican103@example.com") unless u103.valid?
    p103 = Peer.create(user: u103, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u104 = User.find_or_create_by(sca_name: "Ricard of Sable Tree") do |user|
       user.email = "pelican104@example.com"
       user.password = "76YexsUy"
       user.modern_name = ""
    end
    u104 = User.find_for_authentication(email: "pelican104@example.com") unless u104.valid?
    p104 = Peer.create(user: u104, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u105 = User.find_or_create_by(sca_name: "Richard of Alsace") do |user|
       user.email = "Pangurcat@aol.com"
       user.password = "gE42odRq"
       user.modern_name = ""
    end
    u105 = User.find_for_authentication(email: "Pangurcat@aol.com") unless u105.valid?
    p105 = Peer.create(user: u105, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u106 = User.find_or_create_by(sca_name: "Robert MacGryffyn") do |user|
       user.email = "pelican106@example.com"
       user.password = "5bgGdKsP"
       user.modern_name = ""
    end
    u106 = User.find_for_authentication(email: "pelican106@example.com") unless u106.valid?
    p106 = Peer.create(user: u106, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1985-08-17"), active: false, vigilant: false, bio: "")
    u107 = User.find_or_create_by(sca_name: "Gunter von Stein") do |user|
       user.email = "rockyc118@gmail.com"
       user.password = "AUeWracn"
       user.modern_name = "Mike Crowley"
    end
    u107 = User.find_for_authentication(email: "rockyc118@gmail.com") unless u107.valid?
    p107 = Peer.create(user: u107, type: 'Pelican', elevated_by: "Edmund of Hertford and Katryn Bronwyn of Glouchester", elevation_date: Date.parse("1996-05-11"), active: true, vigilant: false, bio: "")
    p107.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/107.png'), filename: '107.png', content_type: 'images/png');
    u108 = User.find_or_create_by(sca_name: "Rolac the Wise") do |user|
       user.email = "pelican108@example.com"
       user.password = "CCsvDa9U"
       user.modern_name = ""
    end
    u108 = User.find_for_authentication(email: "pelican108@example.com") unless u108.valid?
    p108 = Peer.create(user: u108, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u109 = User.find_or_create_by(sca_name: "Rory O'Tomrair") do |user|
       user.email = "pelican109@example.com"
       user.password = "QVJtl2M9"
       user.modern_name = ""
    end
    u109 = User.find_for_authentication(email: "pelican109@example.com") unless u109.valid?
    p109 = Peer.create(user: u109, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u110 = User.find_or_create_by(sca_name: "Serena Holmes") do |user|
       user.email = "pelican110@example.com"
       user.password = "DKqqOvqG"
       user.modern_name = "Marie L. Schulte"
    end
    u110 = User.find_for_authentication(email: "pelican110@example.com") unless u110.valid?
    p110 = Peer.create(user: u110, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "Elevated 12/16/95 by Tarquin the Red and Aibhilin ni Dhomnaill")
    u111 = User.find_or_create_by(sca_name: "Siobhan Medhbh O'Roarke") do |user|
       user.email = "pelican111@example.com"
       user.password = "g7h5LOPo"
       user.modern_name = ""
    end
    u111 = User.find_for_authentication(email: "pelican111@example.com") unless u111.valid?
    p111 = Peer.create(user: u111, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u112 = User.find_or_create_by(sca_name: "Sonya Panek of Prague") do |user|
       user.email = "sonyapraha@aol.com"
       user.deceased = true,
       user.password = "yiDqjhS4"
       user.modern_name = "Andrea Dubnick"
    end
    u112 = User.find_for_authentication(email: "sonyapraha@aol.com") unless u112.valid?
    p112 = Peer.create(user: u112, type: 'Pelican', elevated_by: "Brannos O'longardail and Rebekah MacTiernan", elevation_date: Date.parse("1995-01-07"), active: false, vigilant: false, bio: "")
    u113 = User.find_or_create_by(sca_name: "Takaya Mereleone") do |user|
       user.email = "takaya@juno.com"
       user.password = "GxLjC5Va"
       user.modern_name = "Vickie Poole"
    end
    u113 = User.find_for_authentication(email: "takaya@juno.com") unless u113.valid?
    p113 = Peer.create(user: u113, type: 'Pelican', elevated_by: "Tarquin the Red and Aibhilin ni Dhomnaill", elevation_date: Date.parse("1996-04-13"), active: true, vigilant: false, bio: "I started meeting people in the SCA sometime in 1974 and started attending local meetings, but my first event was Crown Tourney in Rivenstar in 1975.  I helped in the kitchen that evening and have enjoyed feast prep ever since.  I found the SCA a wonderful place to learn all kinds of hobbies that I add to continuously.  I've held a variety of local and regional offices, but mostly I was honored to be Baroness Rivenstar for 29 years.")
    u114 = User.find_or_create_by(sca_name: "Talan Gwynek") do |user|
       user.email = "pelican114@example.com"
       user.password = "B0joqnqI"
       user.modern_name = ""
    end
    u114 = User.find_for_authentication(email: "pelican114@example.com") unless u114.valid?
    p114 = Peer.create(user: u114, type: 'Pelican', elevated_by: "Finn Herjolfsson and Garlanda de Stanas", elevation_date: Date.parse("1992-10-10"), active: false, vigilant: false, bio: "")
    u115 = User.find_or_create_by(sca_name: "Talymar gan y Llwynn") do |user|
       user.email = "gjohnson@seovec.ohio.gov"
       user.password = "rOHqVjN4"
       user.modern_name = "George Johnson"
    end
    u115 = User.find_for_authentication(email: "gjohnson@seovec.ohio.gov") unless u115.valid?
    unless u115.arms.attached?
      u115.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/115.gif'), filename: '115.gif', content_type: 'images/gif');
    end
    p115 = Peer.create(user: u115, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1990-06-23"), active: true, vigilant: false, bio: "Ducal-- Apr 14, 1983  
 County-- Oct 04, 1980  
 Knight-- Aug 18, 1979  
 Pelican-- Jun 23, 1990  
 Order of the Dragon's Heart-- May 12, 1990   
 Award of the Purple Fret-- Jul 14, 1984   
 Award of the Doe's Grace-- Jul 27, 91   
 Order of the Dragon's Tooth-- May 03, 1980   
 Order of the Dragon's Barb-- Aug 17, 1989   
 Award of Arms-- May 14, 1977   
 Augmentation of Arms-- May 17, 1988   
    (On a chief the M.K. badge)

Served on the SCA Board of Directors

Squires Knighted:  
 Baron Thomas ap Llewellyn, KSCA, OL  
 Sir Otto von Schwartzkatz, KSCA  
 Viscount Myles Blackheath, KSCA

Squired to: Duke Andrew of Seldom Rest, KSCA, OP")
    p115.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/115.png'), filename: '115.png', content_type: 'images/png');
    u116 = User.find_or_create_by(sca_name: "Tamarra Amalthea de Romany") do |user|
       user.email = "pelican116@example.com"
       user.password = "frhihF3P"
       user.modern_name = ""
    end
    u116 = User.find_for_authentication(email: "pelican116@example.com") unless u116.valid?
    p116 = Peer.create(user: u116, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u117 = User.find_or_create_by(sca_name: "Thorbjorn the Greysides") do |user|
       user.email = "pelican117@example.com"
       user.deceased = true,
       user.password = "NESYHSY0"
       user.modern_name = ""
    end
    u117 = User.find_for_authentication(email: "pelican117@example.com") unless u117.valid?
    p117 = Peer.create(user: u117, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u118 = User.find_or_create_by(sca_name: "Thorvald inn Grimmi") do |user|
       user.email = "pelican118@example.com"
       user.password = "gD4nz9wx"
       user.modern_name = ""
    end
    u118 = User.find_for_authentication(email: "pelican118@example.com") unless u118.valid?
    p118 = Peer.create(user: u118, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u119 = User.find_or_create_by(sca_name: "Timothy Garagchan o'Leitrim") do |user|
       user.email = "tim.moran.writer@gmail.com"
       user.password = "miTxHfLX"
       user.modern_name = "Tim Moran"
    end
    u119 = User.find_for_authentication(email: "tim.moran.writer@gmail.com") unless u119.valid?
    unless u119.arms.attached?
      u119.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/119.gif'), filename: '119.gif', content_type: 'images/gif');
    end
    p119 = Peer.create(user: u119, type: 'Pelican', elevated_by: "Finn and Garlanda", elevation_date: Date.parse("1994-01-01"), active: true, vigilant: false, bio: "")
    p119.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/119.png'), filename: '119.png', content_type: 'images/png');
    u120 = User.find_or_create_by(sca_name: "Todric Koenig") do |user|
       user.email = "todric@raex.com"
       user.password = "qEehD93P"
       user.modern_name = "Thomas King"
    end
    u120 = User.find_for_authentication(email: "todric@raex.com") unless u120.valid?
    p120 = Peer.create(user: u120, type: 'Pelican', elevated_by: "Valthiona and Osis", elevation_date: Date.parse("1995-08-19"), active: true, vigilant: false, bio: "1st SCA Event 4/1/76 ;  
 Joined Dark Horde 1977  
 AOA 6/9/79  
 Silver Oak 3/28/81  
 OL 8/19/1995 Osis and Valthiona;  
 Asian Studies-Dwellings  
 OP 8/19/1995 Osis and Valthiona:  
 Service to the Society-Pennsic  
 Organized Motor Pool at Pennsic;  
 Organized Mobility Assistance Project;  
 Member Pennsic War Planning Committee  
 Pennsic 20 Security O'Crat  
 Pennsic Staff PW 20,22-30  
 Continuous Attendee since PW6  
 Interests:Alchemy, Early Technology,  
 Brewing, Vintning, Metalwork,  
 Shelters, Asia/Mongolia.")
    p120.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/120.png'), filename: '120.png', content_type: 'images/png');
    u121 = User.find_or_create_by(sca_name: "Trelogin Tavistok") do |user|
       user.email = "trelogin@msn.com"
       user.password = "ZJp3I8ua"
       user.modern_name = "Gary Eaken"
    end
    u121 = User.find_for_authentication(email: "trelogin@msn.com") unless u121.valid?
    p121 = Peer.create(user: u121, type: 'Pelican', elevated_by: "Finn Herjolfsson and Garlanda de Stanas", elevation_date: Date.parse("1994-08-18"), active: true, vigilant: false, bio: "")
    p121.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/121.png'), filename: '121.png', content_type: 'images/png');
    u122 = User.find_or_create_by(sca_name: "Vasili iz Naitemneshoi Dollina") do |user|
       user.email = "vasili@toast.net"
       user.password = "GOZnnzk5"
       user.modern_name = "Rev. James Kubajak"
    end
    u122 = User.find_for_authentication(email: "vasili@toast.net") unless u122.valid?
    unless u122.arms.attached?
      u122.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/122.gif'), filename: '122.gif', content_type: 'images/gif');
    end
    p122 = Peer.create(user: u122, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1988-01-09"), active: false, vigilant: false, bio: "     Order of the Pelican 09 Jan, 1988 (A.S. 22) Court Baron 19 Feb, 1994 (A.S. 28) Order of the Dragon's Heart 20 Aug, 1983 (A.S. 18) Grant of Arms 14 Jul, 1990 (A.S. 25) Order of the Silver Oak 18 Jul, 1992 (A.S. 27) Award of the Purple Fret 29 Jan, 1983 (A.S. 17) Award of the Doe's Grace 29 Feb, 1992 (A.S. 26) Award of Arms 28 Mar, 1981 (A.S. 15) Landed Baron (resigned) 13 Oct, 1990 (A.S. 25) - (Founding) Red Spears")
    u123 = User.find_or_create_by(sca_name: "William of Fairhaven") do |user|
       user.email = "sirbill@housefairhaven.com"
       user.password = "xWbCCjm5"
       user.modern_name = "Patrick Savelli"
    end
    u123 = User.find_for_authentication(email: "sirbill@housefairhaven.com") unless u123.valid?
    unless u123.arms.attached?
      u123.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/123.gif'), filename: '123.gif', content_type: 'images/gif');
    end
    p123 = Peer.create(user: u123, type: 'Pelican', elevated_by: "Valthiona Cuthbert", elevation_date: Date.parse("1995-06-10"), active: true, vigilant: false, bio: "     Knight of the Society940818 Master of the Pelican950610 Grant of Arms970525 Order of the Dragon's Heart930403 Order of the Red Company (Premier) - 940818 Order of the Willow970201 Order of the Willow961013 Award of the Doe's Grace900715 Order of the Dragon's Tooth940226 Award of Arms880319 Award of Arms870627 Augmentation of Arms-- 910713b01 (a golden sun-in-splendour) Order of the Royal Vanguard941015 (Champion to HRM Garlanda II) Award of the Grove-- 950325 (with Farnan Montagar and Connor mac Lellan) Award of the Purple Fretty 961101 Order of the Flaming Brand (Barony of Flaming Gryphon) Order of the Gryphon's Plume (Barony of Flaming Gryphon) Order of the Gryphon's Spear (Barony of Flaming Gryphon) Order of the Sable Shield (Barony of Flaming Gryphon) Academie du Grif (Barony of Flaming Gryphon) Past Middle Kingdom Earl Marshal Past Middle Kingdom Minister of the Lists")
    p123.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/123.png'), filename: '123.png', content_type: 'images/png');
    u124 = User.find_or_create_by(sca_name: "Winifred Yseulte of Hall's Isle") do |user|
       user.email = "pelican124@example.com"
       user.password = "fhOT9fHx"
       user.modern_name = ""
    end
    u124 = User.find_for_authentication(email: "pelican124@example.com") unless u124.valid?
    p124 = Peer.create(user: u124, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1986-01-18"), active: false, vigilant: false, bio: "")
    u125 = User.find_or_create_by(sca_name: "Zardrik Vansson") do |user|
       user.email = "pelican125@example.com"
       user.password = "2Jx0jEdS"
       user.modern_name = "Rick Buzzard"
    end
    u125 = User.find_for_authentication(email: "pelican125@example.com") unless u125.valid?
    p125 = Peer.create(user: u125, type: 'Pelican', elevated_by: "Tarquin the Red and Aibhilin ni Dhomnaill", elevation_date: Date.parse("1995-10-21"), active: true, vigilant: false, bio: "")
    p125.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/125.png'), filename: '125.png', content_type: 'images/png');
    u126 = User.find_or_create_by(sca_name: "Brigh of Writerskeep") do |user|
       user.email = "sholm1@uis.edu"
       user.password = "pUwD3tBg"
       user.modern_name = "Sabrina Holmes"
    end
    u126 = User.find_for_authentication(email: "sholm1@uis.edu") unless u126.valid?
    unless u126.arms.attached?
      u126.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/126.gif'), filename: '126.gif', content_type: 'images/gif');
    end
    p126 = Peer.create(user: u126, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1998-07-25"), active: true, vigilant: false, bio: "")
    p126.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/126.png'), filename: '126.png', content_type: 'images/png');
    u127 = User.find_or_create_by(sca_name: "Calum MacDhaibhidh") do |user|
       user.email = "Calum@wowway.com"
       user.password = "9wt1mfQi"
       user.modern_name = "Jeff Estep"
    end
    u127 = User.find_for_authentication(email: "Calum@wowway.com") unless u127.valid?
    unless u127.arms.attached?
      u127.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/128.gif'), filename: '128.gif', content_type: 'images/gif');
    end
    p127 = Peer.create(user: u127, type: 'Pelican', elevated_by: "Ragnvaldr and Arabella", elevation_date: Date.parse("1999-08-19"), active: true, vigilant: false, bio: "")
    p127.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/128.png'), filename: '128.png', content_type: 'images/png');
    u128 = User.find_or_create_by(sca_name: "Henry Best") do |user|
       user.email = "MidrealmWizard@gmail.com"
       user.password = "sJxHQzh4"
       user.modern_name = ""
    end
    u128 = User.find_for_authentication(email: "MidrealmWizard@gmail.com") unless u128.valid?
    unless u128.arms.attached?
      u128.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/129.gif'), filename: '129.gif', content_type: 'images/gif');
    end
    p128 = Peer.create(user: u128, type: 'Pelican', elevated_by: "Logan and Arielle (Atlantia)", elevation_date: Date.parse("1997-02-02"), active: true, vigilant: false, bio: " **Areas of Study:**

- Performing Arts 
  - Juggling
  - Magic & Mentalism
  - Theatre especially Shakespeare
- Underworld Activities 
  - Gambling
  - Cozenage
  - Fortunetelling
  - Vagabondage and Street Culture
- Natural Philosophy 
  - Divinatory Arts
    - Astrology
    - Palmistry
    - Cartomancy
    - Scrying
  - Occultism

 

**ATTENTION PERFORMERS:**

If you have an SCA performance you need help with, I have extensive professional experience in the variety arts and am available to help you as a theatrical director. I charge high rates for this service modernly, but in the SCA, you can buy me lunch or something. Email is the best way to reach me.")
    p128.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/129.png'), filename: '129.png', content_type: 'images/png');
    u129 = User.find_or_create_by(sca_name: "Fern de la Foret") do |user|
       user.email = "sirfern@sbcglobal.net"
       user.password = "EYZDUEhf"
       user.modern_name = "Laurie Erickson"
    end
    u129 = User.find_for_authentication(email: "sirfern@sbcglobal.net") unless u129.valid?
    unless u129.arms.attached?
      u129.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/130.gif'), filename: '130.gif', content_type: 'images/gif');
    end
    p129 = Peer.create(user: u129, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1997-02-01"), active: true, vigilant: false, bio: "")
    p129.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/130.png'), filename: '130.png', content_type: 'images/png');
    u130 = User.find_or_create_by(sca_name: "Guenievre du Dragon Vert") do |user|
       user.email = "pelican130@example.com"
       user.password = "lHHL2BCa"
       user.modern_name = "Jennifer Carlson"
    end
    u130 = User.find_for_authentication(email: "pelican130@example.com") unless u130.valid?
    unless u130.arms.attached?
      u130.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/131.gif'), filename: '131.gif', content_type: 'images/gif');
    end
    p130 = Peer.create(user: u130, type: 'Pelican', elevated_by: "Rangvaldr & Arabella / Vigil by Dag & Elayna", elevation_date: Date.parse("1999-07-10"), active: false, vigilant: false, bio: "Protégé: Baroness Frances Elizabeth Deveraux  
Protégé (elevated 2012): Baroness Marwen de la Riviere.  
Specialties: Seneschal, Event Steward, Herald (field & court).  
Enjoys: Costuming, Rapier, Thrown Weapons, Archery.  
Persona: early 1500s, English/French.  
Alt. Persona (Gunilda): 10th c. Swedish.")
    p130.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/131.png'), filename: '131.png', content_type: 'images/png');
    u131 = User.find_or_create_by(sca_name: "Edward of Effingham") do |user|
       user.email = "ajbryant@comcast.net"
       user.deceased = true,
       user.password = "xvvWRTHD"
       user.modern_name = "Anthony Bryant"
    end
    u131 = User.find_for_authentication(email: "ajbryant@comcast.net") unless u131.valid?
    unless u131.arms.attached?
      u131.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/132.gif'), filename: '132.gif', content_type: 'images/gif');
    end
    p131 = Peer.create(user: u131, type: 'Pelican', elevated_by: "Philip & Linda (West)", elevation_date: Date.parse("1992-01-04"), active: false, vigilant: false, bio: "")
    p131.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/132.png'), filename: '132.png', content_type: 'images/png');
    u132 = User.find_or_create_by(sca_name: "John Inchingham") do |user|
       user.email = "inchingham@hotmail.com"
       user.password = "FjqKlj9B"
       user.modern_name = "Steve Katlack"
    end
    u132 = User.find_for_authentication(email: "inchingham@hotmail.com") unless u132.valid?
    unless u132.arms.attached?
      u132.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/148.gif'), filename: '148.gif', content_type: 'images/gif');
    end
    p132 = Peer.create(user: u132, type: 'Pelican', elevated_by: "Finn and Tamara", elevation_date: Date.parse("2000-04-01"), active: true, vigilant: false, bio: "Baron John of Illiton (Master John Inchingham the Fool), OL, OP, former Middle Kingdom Rapier Marshal, former apprentice of Master John ap Wynne, and wayward squire of Sir Ixtilixochitl, joined the SCA in Ansteorra but has lived in the Midrealm for the past 30 years. John and his Lady-wife, Mistress Maire ingen Dauith are currently baron and baroness of Illiton (Peoria, Illinois).

Before their elevations, Master Cerian Cantwr and Mistress Lorelei Skye were John\'s apprentices and Masters Torquil MacGillavrey and Philippe de Lyon were his proteges. Lord David de Longville was also apprenticed to John until his untimely death. Master Inchingham\'s current apprentices are Master Alexander de Seton, Lord Olaf ByGolly, Master Dahrien Cordell, Dame Marie la Fauconniere, Lady Tualaith of Sternfeld, The Honorable Lady Heregyth Ketilsdottir and Lady Hildigunnr Halldorsdottir. His current proteges are The Honorable Lady Catalin Zoldzem, The Honorable Lord Simon Hondy and His Excellency, Baron Kurro Ookami.")
    p132.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/148.png'), filename: '148.png', content_type: 'images/png');
    u133 = User.find_or_create_by(sca_name: "Kassandra NickKraken") do |user|
       user.email = "Connie.Bunny@insightbb.com"
       user.password = "Gh8r9QBW"
       user.modern_name = "Connie Marie Carroll"
    end
    u133 = User.find_for_authentication(email: "Connie.Bunny@insightbb.com") unless u133.valid?
    p133 = Peer.create(user: u133, type: 'Pelican', elevated_by: "John and Rhondalynn of Meridies", elevation_date: Date.parse("1984-09-09"), active: true, vigilant: false, bio: "     County Jan-15-78 Meridies Viscounty Jul-9-77 Meridies Pelican Sep-8-84 Meridies Barony Jun-11-94 Ansteorra Bough,Meridies Oct -8-77 Meridies Iris of Merit Oct-3-92 Ansteorra Grant of Arms Mar-17-79 Meridies Velvetr Owl Dec.13.80 Meridies Meridian Majesty Mar-17-79 Meridies Broken Brank Aug-1-81 Meridies Burning Trumpet Jan-5-85 Meridies Award of Arms Jul-25-77 Atenveldt Order of the Rose Jul-15-78 Meridies,Principal  Baronial Awards:  Order of Denial,Niche (Grey Niche,Meridies) Jul-15-78 Order of the Magnolia (Grey Niche,Meridies) ?-?-80 Order of the Snowflake (Grey Niche,Meridies) ?-?-80 Order of the Dreigiau Bryn (Bryn Gwlad,Ansteorra) Jun-11-94 Order of the Muse (Bryn Gwlad,Ansteorra) Jun-11-94 Order of the Marlet (Bryn Gwlad,Ansteorra) Jun-20-95  Created the Office of Bagetelle Herald in Meridies 1980")
    p133.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/133.png'), filename: '133.png', content_type: 'images/png');
    u134 = User.find_or_create_by(sca_name: "Arthen ap Rhodri") do |user|
       user.email = "growlands13@gmail.com"
       user.password = "eOwVC3nj"
       user.modern_name = "Greg Rowlands"
    end
    u134 = User.find_for_authentication(email: "growlands13@gmail.com") unless u134.valid?
    p134 = Peer.create(user: u134, type: 'Pelican', elevated_by: "Ragnvaldr & Arabella", elevation_date: Date.parse("1999-09-11"), active: false, vigilant: false, bio: "")
    p134.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/134.png'), filename: '134.png', content_type: 'images/png');
    u135 = User.find_or_create_by(sca_name: "Miriam bat Yudah") do |user|
       user.email = "pelican135@example.com"
       user.password = "pOZGDpHX"
       user.modern_name = ""
    end
    u135 = User.find_for_authentication(email: "pelican135@example.com") unless u135.valid?
    p135 = Peer.create(user: u135, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1993-01-30"), active: true, vigilant: false, bio: "")
    u136 = User.find_or_create_by(sca_name: "Ian Gourdon of Glen Awe") do |user|
       user.email = "agincort@att.net"
       user.password = "OvowV2yq"
       user.modern_name = "Dan Stratton"
    end
    u136 = User.find_for_authentication(email: "agincort@att.net") unless u136.valid?
    unless u136.arms.attached?
      u136.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/136.gif'), filename: '136.gif', content_type: 'images/gif');
    end
    p136 = Peer.create(user: u136, type: 'Pelican', elevated_by: "Ranwalder and Arabella", elevation_date: Date.parse("1999-09-18"), active: true, vigilant: false, bio: "")
    p136.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/136.png'), filename: '136.png', content_type: 'images/png');
    u137 = User.find_or_create_by(sca_name: "Patrick Connor O'Donnell McPhelan") do |user|
       user.email = "robertcripps@hotmail.com"
       user.password = "BO8OhLL1"
       user.modern_name = "Robert Cripps"
    end
    u137 = User.find_for_authentication(email: "robertcripps@hotmail.com") unless u137.valid?
    p137 = Peer.create(user: u137, type: 'Pelican', elevated_by: "Ragnvaldr and Arabella Silvermane", elevation_date: Date.parse("1999-09-18"), active: true, vigilant: false, bio: "Elevated 9/18/99 by Ragnvaldr Jonsson and Arabella Silvermane")
    p137.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/137.png'), filename: '137.png', content_type: 'images/png');
    u138 = User.find_or_create_by(sca_name: "Rebekah MacTiernan") do |user|
       user.email = "rebekah@safeville.com"
       user.password = "5QYM5w9X"
       user.modern_name = "Rebecca Muller"
    end
    u138 = User.find_for_authentication(email: "rebekah@safeville.com") unless u138.valid?
    unless u138.arms.attached?
      u138.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/138.gif'), filename: '138.gif', content_type: 'images/gif');
    end
    p138 = Peer.create(user: u138, type: 'Pelican', elevated_by: "Ragnvaldr & Arabella", elevation_date: Date.parse("1999-09-18"), active: true, vigilant: false, bio: "    
    Duke / Duchess 16 Apr, 2005 (A.S. 39)  
    Count / Countess 06 May, 1995 (A.S. 30)   
    Order of the Rose 06 May, 1995 (A.S. 30)   
    Order of the Laurel 23 Sep, 1995 (A.S. 30)   
    Order of the Pelican 18 Sep, 1999 (A.S. 34)   
    Kingdom Augmentation of Arms 7, Aug, 2008 (A.S. 43)  
    Royal Augmentation of Arms 2 May, 2009  
    Court Baron / Baroness 02 Oct, 1993 (A.S. 28)  
    Order of the Dragon's Heart 20, Oct, 2007 (A.S. 42)  
    Order of the Willow 12 Feb, 1994 (A.S. 28)  
    Award of the Doe's Grace 09 Feb, 1991 (A.S. 25)  
    Award of the Purple Fret 27 Mar, 1993 (A.S. 27)   
    Award of Arms 30 Apr, 1988 (A.S. 22)
    
       
      
    Order of the Chalice Barony of Roaring Waste   
    Friend of my Friend Barony of Roaring Waste   
    White Wolf Barony of Northwoods   
    North Star Barony of Northwoods")
    p138.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/138.png'), filename: '138.png', content_type: 'images/png');
    u139 = User.find_or_create_by(sca_name: "Arianna Llwyd") do |user|
       user.email = "arianna.llwyd@gmail.com"
       user.password = "2gZ79oCl"
       user.modern_name = "Marilee Lloyd"
    end
    u139 = User.find_for_authentication(email: "arianna.llwyd@gmail.com") unless u139.valid?
    p139 = Peer.create(user: u139, type: 'Pelican', elevated_by: "Ragnvaldr and Arabella", elevation_date: Date.parse("1999-09-25"), active: true, vigilant: false, bio: "")
    p139.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/139.png'), filename: '139.png', content_type: 'images/png');
    u140 = User.find_or_create_by(sca_name: "Elysabet de Warren") do |user|
       user.email = "libbet@cs.com"
       user.password = "Ka2n9DaN"
       user.modern_name = "Libbet Proudfit"
    end
    u140 = User.find_for_authentication(email: "libbet@cs.com") unless u140.valid?
    p140 = Peer.create(user: u140, type: 'Pelican', elevated_by: "Ragnvaldr and Arabella", elevation_date: Date.parse("1999-09-25"), active: false, vigilant: false, bio: "")
    u141 = User.find_or_create_by(sca_name: "Rory mac Feidhlimidh") do |user|
       user.email = "klconlin@scolairi.org"
       user.password = "Jn1A0hxG"
       user.modern_name = "Kevin L. Conlin"
    end
    u141 = User.find_for_authentication(email: "klconlin@scolairi.org") unless u141.valid?
    unless u141.arms.attached?
      u141.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/141.gif'), filename: '141.gif', content_type: 'images/gif');
    end
    p141 = Peer.create(user: u141, type: 'Pelican', elevated_by: "Finn III & Tamara", elevation_date: Date.parse("1999-10-30"), active: true, vigilant: false, bio: "")
    p141.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/141.png'), filename: '141.png', content_type: 'images/png');
    u142 = User.find_or_create_by(sca_name: "Therica Pembroke of Stonegate Manor") do |user|
       user.email = "therica@msn.com"
       user.password = "I3rQTIP7"
       user.modern_name = ""
    end
    u142 = User.find_for_authentication(email: "therica@msn.com") unless u142.valid?
    p142 = Peer.create(user: u142, type: 'Pelican', elevated_by: "King Finn and Queen Tamara", elevation_date: Date.parse("1999-12-11"), active: false, vigilant: false, bio: "")
    p142.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/142.png'), filename: '142.png', content_type: 'images/png');
    u143 = User.find_or_create_by(sca_name: "Sayf Al-Qamar Tarik Ibn Abdul") do |user|
       user.email = "Tarik_OL@hotmail.com"
       user.password = "rPjXYLAc"
       user.modern_name = "Chuck Burton"
    end
    u143 = User.find_for_authentication(email: "Tarik_OL@hotmail.com") unless u143.valid?
    unless u143.arms.attached?
      u143.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/143.gif'), filename: '143.gif', content_type: 'images/gif');
    end
    p143 = Peer.create(user: u143, type: 'Pelican', elevated_by: "Finn & Tamara", elevation_date: Date.parse("2000-01-08"), active: false, vigilant: false, bio: "")
    p143.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/143.png'), filename: '143.png', content_type: 'images/png');
    u144 = User.find_or_create_by(sca_name: "Judith of Kirtland") do |user|
       user.email = "pelican144@example.com"
       user.password = "ciUgXIFc"
       user.modern_name = "Judith Carr"
    end
    u144 = User.find_for_authentication(email: "pelican144@example.com") unless u144.valid?
    p144 = Peer.create(user: u144, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1993-01-02"), active: false, vigilant: false, bio: "")
    u145 = User.find_or_create_by(sca_name: "Kelinda Garrett") do |user|
       user.email = "pelican145@example.com"
       user.password = "u3N3YfuG"
       user.modern_name = ""
    end
    u145 = User.find_for_authentication(email: "pelican145@example.com") unless u145.valid?
    p145 = Peer.create(user: u145, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u146 = User.find_or_create_by(sca_name: "Rosamund Beauvisage") do |user|
       user.email = "rosamund99@hotmail.com"
       user.password = "gUkF1GCL"
       user.modern_name = "Laura Hume"
    end
    u146 = User.find_for_authentication(email: "rosamund99@hotmail.com") unless u146.valid?
    unless u146.arms.attached?
      u146.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/145.gif'), filename: '145.gif', content_type: 'images/gif');
    end
    p146 = Peer.create(user: u146, type: 'Pelican', elevated_by: "Finn III & Tamara I", elevation_date: Date.parse("2000-02-26"), active: true, vigilant: false, bio: "    
    
        
        
            
        
        
        
        
            **_Domina misericordia non domi erit hac nocte_. ** 
        
    
    

**CURRENT FUNCTIONS:** Emergency Mayor, Pennsic War 47; Seneschal, Marche of Winged Hills.

**MOST NOTABLE ACCOMPLISHMENTS:** MK Seneschal (A.S. 36-38), Pennsic 36 Mayor (A.S.  42);    MK A&S Champion; Dean of the College of History for RUM; staying out of trouble.

**APPRENTICES:** Lady Appolonia von Wurttenberg, THL Jerusha a\'Laon.

**PROTEGES:** Lady Appolonia von Wurttenberg, Lord Hergeirr Olafsson and Lady Ainthfine Hergeirrskona. 

**FAVES:** Husband, Brad, daughter, Elisabeth Beauvisage (MKA Alexandra); TRUE friends; fixing what needs to be fixed and doing what needs to be done; sparklies (especially green ones); GOOD single-malt scotch; REALzinfandel (not that pink stuff); homemade marzipan; belly laughs; classic rock music. 

**HATES:** Injustice; unkindness; roughing it (slow room service); my thighs. \'Nuf said.

**MILESTONES:                                                                                                                                                    ** Joined SCA (Sept., A.S. 25)

Laurel (May, A.S. 30) 

Court Baroness (Sept., A.S. 31)

Pelican (Feb., A.S. 34)

Royal Augmentation of Arms (Sept., A.S. 38)

Kingdom Augmentation of Arms (April, A.S., 49)

Daughter Elisabeth\'s Dragon\'s Treasure (Aug., A.S. 42)

Daughter Elisabeth\'s AoA (Mar., A.S. 44)

Daughters Elisabeths Royal Augmentation (April, A.S. 45)

Daughter Elisabeths Does Grace (April, A.S. 45)")
    p146.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/145.png'), filename: '145.png', content_type: 'images/png');
    u147 = User.find_or_create_by(sca_name: "Una Wynnifreed Berry") do |user|
       user.email = "deniseuna@wowway.com"
       user.password = "96yoGovc"
       user.modern_name = "Denise Fraze Weible"
    end
    u147 = User.find_for_authentication(email: "deniseuna@wowway.com") unless u147.valid?
    unless u147.arms.attached?
      u147.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/276.gif'), filename: '276.gif', content_type: 'images/gif');
    end
    p147 = Peer.create(user: u147, type: 'Pelican', elevated_by: "Count Sir Ullr Amaranthson (Vindstygge) and Contess Anne Lyse Van Gavere", elevation_date: Date.parse("2011-04-02"), active: true, vigilant: false, bio: "Una was born in the 1000\'s in Kingdom of Munster to Irish Noblity. Later that part of Ireland was know as Kingdom of Desmond. There she was raised to run household of a keep. She was trained mentor the Fianna of a future husband. She received some education from School of Ross trained teacher. She traveled to Wales to study the bardic arts There she became know as Wynnifreed which is just Una in Welsh Gaelic.   Una Wynnifreed Berry service was Landed Baroness of Middle Marches and to Arts and Science community. She has served as Herald, chronicler, Minister of Arts and Sciences, and Judges Coordinator. She also served as the coordinator of Pennsic Performing Arts Tent and Amphitheater.")
    p147.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/276.png'), filename: '276.png', content_type: 'images/png');
    u148 = User.find_or_create_by(sca_name: "Jervisa Wainwright") do |user|
       user.email = "jervisa.w@sbcglobal.net"
       user.password = "d56DJ10Y"
       user.modern_name = "Liz Burton"
    end
    u148 = User.find_for_authentication(email: "jervisa.w@sbcglobal.net") unless u148.valid?
    unless u148.arms.attached?
      u148.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/146.gif'), filename: '146.gif', content_type: 'images/gif');
    end
    p148 = Peer.create(user: u148, type: 'Pelican', elevated_by: "Finn and Tamara", elevation_date: Date.parse("2000-02-12"), active: true, vigilant: false, bio: "")
    u149 = User.find_or_create_by(sca_name: "Dafydd Blaidd") do |user|
       user.email = "dafydd@midrealm.org"
       user.password = "N8R1IRvf"
       user.modern_name = "Dave Majors"
    end
    u149 = User.find_for_authentication(email: "dafydd@midrealm.org") unless u149.valid?
    unless u149.arms.attached?
      u149.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/149.gif'), filename: '149.gif', content_type: 'images/gif');
    end
    p149 = Peer.create(user: u149, type: 'Pelican', elevated_by: "Finn III and Tamara I", elevation_date: Date.parse("2000-04-01"), active: true, vigilant: false, bio: "> \"What a wonderful bird is the Pelican,  
> His bill can hold more than his belly can  
> He can take in his beak food enough for a week  
> But I'm damned if I see how the hell 'e can.\" 
> 
> > > - mis-attributted to Ogden Nash

* * *

I was elevated on April Fool's Day in 2000.  Should I read anything into that?

 

* * *
 

What do I think a Pelican is?

I only _really_ thought about this after having been elevated. When I am looking at someone as a potential candidate, I look at several criteria:

- _Do they have the head, heart, and soul of a servant to the Society and Crown?_ -Is service not their 'second' nature, but rather their first? Can they not just do work, but actually lead and inspire others to do service? 
- _Do they make a difference?_ - This is sometimes called the \"hole\" test. If this person were to immediately leave for one reason or another, how big would be the hole they would leave? If this person were never in the SCA what would be different? 
- _Are they a good example to others?_ - If a new person were to ask me, \"How should I do X?\", can I point to this person and say \"Do it like they do\". Can I look to this person and say, \"That's how people should be\"? These are what I call their 'Peerlike Qualities'. 
- _Do they have fun?_ - This may seem trivial to some but I am of the opinion that if what you are doing in the SCA is not fun (for the most part)...\*stop\*. If someone is working their tail off doing something that they don't like, it seems to me that they are likely doing it to get the recognition or the \"dangly\". In this case, what happens when they are recognized? All the hard work stops and they bask in their own light for the world to see. 
- _Do they cause more good than harm?_ - Visc. Myles Blackheath, KSCA, OP told me at my vigil, \"When looking at a potential candidate, look at their service rendered:chaos engendered ratio\" I like that statement so much that I steal it whenever I can.

* * *

Although I previously declined to take proteges, I have since rethought my position and now I have several proteges. They are:

**Olaf Brekebalde** - (inactive)

**Lady Geneviefve de Chenonceaux**     
  

* * *

[**Duchess Sabine de Rouen**](peer.php?input=243 \"Duchess\") - Sabine was elevated at Harvest Day in 2007.

[**Baron Alexander Kyppyn Kirkcaldy, KSCA**](peer.php?input=255 \"Sir\") - Kyppyn was elevated at Fall Crown Tournament in 2008.

[**Baroness Christiana de Burgh**](../peer_new.php?input=359 \"Baroness\") - Elevated at Harvest Days in 2017.

**[Baroness Finepopla Gunnarswif](../peer_new.php?input=362 \"Baroness\") -** Will be elevated at Christmas Tourney in 2017.")
    p149.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/149.png'), filename: '149.png', content_type: 'images/png');
    u150 = User.find_or_create_by(sca_name: "Thorvald Redhair") do |user|
       user.email = "Thorvaldr@wowway.com"
       user.password = "vbgCcQ4b"
       user.modern_name = "Ron Sargent"
    end
    u150 = User.find_for_authentication(email: "Thorvaldr@wowway.com") unless u150.valid?
    unless u150.arms.attached?
      u150.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/150.gif'), filename: '150.gif', content_type: 'images/gif');
    end
    p150 = Peer.create(user: u150, type: 'Pelican', elevated_by: "Finn and Tamara", elevation_date: Date.parse("2000-04-29"), active: true, vigilant: false, bio: "")
    p150.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/150.png'), filename: '150.png', content_type: 'images/png');
    u151 = User.find_or_create_by(sca_name: "Arinwald Rotstein") do |user|
       user.email = "arinwaldrotstein@yahoo.com"
       user.password = "cye7tPIB"
       user.modern_name = "Tim Henry"
    end
    u151 = User.find_for_authentication(email: "arinwaldrotstein@yahoo.com") unless u151.valid?
    p151 = Peer.create(user: u151, type: 'Pelican', elevated_by: "Finn and Tamara", elevation_date: Date.parse("2000-04-08"), active: true, vigilant: false, bio: "")
    p151.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/151.png'), filename: '151.png', content_type: 'images/png');
    u152 = User.find_or_create_by(sca_name: "Dierdriana of the Misty Isles") do |user|
       user.email = "MW-SL-Clifton@worldnet.att.net"
       user.password = "SaG2S9uQ"
       user.modern_name = "Maureen Whitaker Clifton"
    end
    u152 = User.find_for_authentication(email: "MW-SL-Clifton@worldnet.att.net") unless u152.valid?
    p152 = Peer.create(user: u152, type: 'Pelican', elevated_by: "Radnor & Shannon-Morgan (West)", elevation_date: Date.parse("1981-01-03"), active: true, vigilant: false, bio: "     Most Courteous Greetings Unto All . . . who read these words . . .  This is Countess Dierdriana of The Misty Isles, Order of the Pelican, Order of The Rose, Queen's Order of Grace, Order of the Leaf of Merit, Order of the Rose Leaf, Order of the Wooden Spoon, Five Queen's Cyphers, Order of the Grape Leaf from Barony of Vinhold, Award of Arms, Order of the Golden Bean (Esfenn). . .sending greetings upon this time, A.S. XXXV (2000 A.D.) . . .  My her-story with the Society for Creative Anachronism, Inc. is a long one, having joined in A.S. iX (1976 A.D.) in the Barony of Golden Rivers, Kingdom of The West. At that time, the SCA was small, by today's standards and there was only two Principalities in the West, CAID and An Tir. The SCA had only four Kingdoms when I joined. I am not quite a \"dinosaursress,\" however, often, when stories are told, it almost seems so. However, I do admit, I know all of those wonderful SCA Dinosaurs . . .the legends of The West Kingdom.  I've been a member of House Bellatrix for many years. Duke Paul was one of the first people whom I met in the SCA when our children were smalls. Now, we are Grandparents with Adult Children! I have to agree with what my dear friend Countess Bevin Fraser of Sterling once said to me and that is this: \"We are not old enough to have adults for children!\" However, we and many others do and it seems we are now in the third generation of SCA families!  After spending years living in Golden Rivers (Sacramento CA), I moved to the greater San Francisco Bay Area, where a group of us got together and started the Shire of Esfenn and eventually, The Principality of The Mists. During my years there, it was a pleasure to Autocrat Twelfth Night at least three times and help others learn how to do that, too. King Radnor gave me my Pelican (what a surprise that was) at Twelfth Night A.S. XV.  Other Kingdom of The West Awards are these: Countess & Order of The Rose - August A.S. XiX (1984 A.D.) ~ My King was Duke Ronald Wilmot, KSCA, OP, now East Kingdom Award of Arms - October A.S. Xiii (1978 A.D.) Queen's Order of Grace - August XX Order of the Leaf of Merit - March Xiii Order of the Rose Leaf - March XV Order of the Wooden Spoon - October XVii Five Queen's Cyphers: Verena, Rhiannon, Shannon-Morgan, Esmirelda & Rowena Arts & Sciences Champion, Shire of Dael Beorht, January A.S. XXiV (1990 A.D.) Fellowship of The Aspen Leaf - January, A.S. XXVi (1992 A.D.) Order of the Grape Leaf from Barony of Vinhold A.S. XXi (1987 A.D.) Order of the Golden Bean (Esfenn) A.S. XVii (or so) Top 10 Archers of the West - A.S. XiV ^LI have also taught SCA classes along the way to include: Dierdriana's Fantastic Gambazons, Effective Autocratting, Guide to Being an Attendant to Royalty, A 12th Century Norman Costume, A Ladies Leather Vest . . .all for which I have written manuals. Also, I have taught classes on Assessories for the Total Look and How to Act Respectfully or How to Address Royalty and Peer Recognition.  Along the way, I have participated in numerous SCA Demos, including one for French Television on What Americans Do for Fun and Entertainment. I have also done all the mundane things, all aspects of autocratting, cooking for and hosting feasts, hall set-up and clean-up, stacking firewood, camp detail. Then, there is Archery practice and sponsoring tournaments, including making 6 foot targets, dragons and Teradactiles. While in the Shire of Dael Beohrt, I sponsored my own Games Tournament which was also a Shire Fund-Raiser and done in conjunction with our local Delta County Arts and Humanities Council of which I was a member.  So, just with this brief overview, one can see that there has not been any dull moments in my SCA life. I've had to take some time out for mundane surgery and healing time. However, I look forward to \"playing\" SCA in the Midrealm, via Atenveldt (Phoenix AZ), Artemesia (Dael Beohrt) and The West. How much my Lord Scott of Kent and I will \"play\" here will depend upon a number of factors, my health, not-with-standing.  Wishing all good health with hopes of meeting many of the kind folks who have been kind enough to send \"virtual mail\" to me recently! My gratitude to you all . . .  Yours in Service . . .  Countess Dierdriana of The Misty Isles Order of The Pelican, Order of The Rose E-mail: MW-SL-Clifton@worldnet.att.net")
    u153 = User.find_or_create_by(sca_name: "Malcolm MacMalcolm") do |user|
       user.email = "nmaclay@yahoo.com"
       user.password = "NRr7Defd"
       user.modern_name = "Neil Maclay"
    end
    u153 = User.find_for_authentication(email: "nmaclay@yahoo.com") unless u153.valid?
    unless u153.arms.attached?
      u153.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/153.gif'), filename: '153.gif', content_type: 'images/gif');
    end
    p153 = Peer.create(user: u153, type: 'Pelican', elevated_by: "HRM Kane OShannon (Atlantia)", elevation_date: Date.parse("1995-02-11"), active: false, vigilant: false, bio: "")
    p153.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/153.png'), filename: '153.png', content_type: 'images/png');
    u154 = User.find_or_create_by(sca_name: "Malcolm Drum") do |user|
       user.email = "lariandrobert@fuse.net"
       user.password = "YOZNrk2s"
       user.modern_name = ""
    end
    u154 = User.find_for_authentication(email: "lariandrobert@fuse.net") unless u154.valid?
    p154 = Peer.create(user: u154, type: 'Pelican', elevated_by: "Dag IV and Elayna II", elevation_date: Date.parse("2000-08-18"), active: true, vigilant: false, bio: "")
    p154.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/154.png'), filename: '154.png', content_type: 'images/png');
    u155 = User.find_or_create_by(sca_name: "Myles Blackheath") do |user|
       user.email = "viscountmyles@hotmail.com"
       user.password = "AcaHDKlW"
       user.modern_name = "Micheal Reeseman"
    end
    u155 = User.find_for_authentication(email: "viscountmyles@hotmail.com") unless u155.valid?
    unless u155.arms.attached?
      u155.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/155.gif'), filename: '155.gif', content_type: 'images/gif');
    end
    p155 = Peer.create(user: u155, type: 'Pelican', elevated_by: "Dag III and Elayna II", elevation_date: Date.parse("2000-09-16"), active: false, vigilant: false, bio: "Greetings all and virtually met!  
 You can find our more than you ever wanted to know about me and my house at our website:

[http://www.angelfire.com/mi/whitetower/](http://www.angelfire.com/mi/whitetower/)")
    p155.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/155.png'), filename: '155.png', content_type: 'images/png');
    u156 = User.find_or_create_by(sca_name: "Thorhalla Carlsdottir af Broberg") do |user|
       user.email = "Ancestor_Hunter@hotmail.com"
       user.password = "ddKwGNM7"
       user.modern_name = "Terry A Broberg-Swangin"
    end
    u156 = User.find_for_authentication(email: "Ancestor_Hunter@hotmail.com") unless u156.valid?
    unless u156.arms.attached?
      u156.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/156.gif'), filename: '156.gif', content_type: 'images/gif');
    end
    p156 = Peer.create(user: u156, type: 'Pelican', elevated_by: "Dag IV & Elayna II", elevation_date: Date.parse("2000-09-16"), active: true, vigilant: false, bio: "The Honorable Meistara Thorhalla Carlsdottir af Broberg is a wealthy 9th century Norse landowner living outside of Birka in Sweden. Meistara Thorhalla is noted in Middle Kingdom legend as The Pit Bull of the Arts and Sciences, a term coined by Lord Charric van der Vliet. Terry is happily back in the SCA after a 5 year hiatus to care for her husband with C.T.E.. She will answer all inquiries. Terry also enjoys genealogical research, crochet and reading. She lives in her bower The Mountain Bridge Bower under the careful management of her pocket Pit Bull Molly Louise. Of course Terry has a pit bull, consider her nickname!")
    p156.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/156.png'), filename: '156.png', content_type: 'images/png');
    u157 = User.find_or_create_by(sca_name: "Hadley of Beckenham") do |user|
       user.email = "hadley.of.beckenham@gmail.com"
       user.password = "gBI3q43h"
       user.modern_name = "Hadley Rochby"
    end
    u157 = User.find_for_authentication(email: "hadley.of.beckenham@gmail.com") unless u157.valid?
    p157 = Peer.create(user: u157, type: 'Pelican', elevated_by: "Alric and Katherine", elevation_date: Date.parse("2018-08-09"), active: true, vigilant: false, bio: "")
    p157.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/369.png'), filename: '369.png', content_type: 'images/png');
    u158 = User.find_or_create_by(sca_name: "Catriona nicHugh Mclaey") do |user|
       user.email = "catriona@4th.com"
       user.password = "YGsOrw9S"
       user.modern_name = "Marti Livingstone"
    end
    u158 = User.find_for_authentication(email: "catriona@4th.com") unless u158.valid?
    unless u158.arms.attached?
      u158.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/305.gif'), filename: '305.gif', content_type: 'images/gif');
    end
    p158 = Peer.create(user: u158, type: 'Pelican', elevated_by: "Cellach and Vukasin", elevation_date: Date.parse("2014-03-01"), active: true, vigilant: false, bio: "")
    p158.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/305.png'), filename: '305.png', content_type: 'images/png');
    u159 = User.find_or_create_by(sca_name: "Maire ingen Dauith") do |user|
       user.email = "mmfrazier@gmail.com"
       user.password = "ceo1tlvx"
       user.modern_name = "Meg Frazier"
    end
    u159 = User.find_for_authentication(email: "mmfrazier@gmail.com") unless u159.valid?
    p159 = Peer.create(user: u159, type: 'Pelican', elevated_by: "Cameron", elevation_date: Date.parse("2014-08-22"), active: true, vigilant: false, bio: "")
    p159.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/306.png'), filename: '306.png', content_type: 'images/png');
    u160 = User.find_or_create_by(sca_name: "Dirk Edward of Frisia") do |user|
       user.email = "dirkhermance@gmail.com"
       user.password = "6XKOTEUL"
       user.modern_name = "Dirk Hermance"
    end
    u160 = User.find_for_authentication(email: "dirkhermance@gmail.com") unless u160.valid?
    unless u160.arms.attached?
      u160.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/307.gif'), filename: '307.gif', content_type: 'images/gif');
    end
    p160 = Peer.create(user: u160, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-08-07"), active: true, vigilant: false, bio: "My persona is based in England just post the Plague years - 1363. My roots are Frisian by birth, and as I was adopted by an English noble at a young age, there is very little I know beyond this. The Friese carry no written records to speak of. I travel out of country on business. To keep myself busy I have had a business in cloth and herbs and have been known to dress in mufti to go among the home weavers and spinners as well as growers of herbs. In this manner I can generate a fair price and pay a fair price, obtain the highest quality materials I can find, and thus re-sell it for a modest profit. I\'m not a stranger to wars and conflicts and will raise a sword on behalf of my home and Crown. I study military tactics and modern methods of the grenadier, particularly in siege and ballistic weapons. My ability to travel in mufti has helped me obtain valuable information for my Crown. --------------------- SCA background: I\'m a dinosaur. I started in the SCA in AS 9. I\'ve lived in 3 kingdoms. Initially started my fighter training in the Mists after trying it for the first time at a demo in the East before moving. I\'ve been in the Middle Kingdom since 1981. I\'ve served in a lot of offices, done innumerable demos, events and feasts. I share all this experience with anyone who asks, and continue to find new interests to explore in the SCA.")
    p160.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/307.png'), filename: '307.png', content_type: 'images/png');
    u161 = User.find_or_create_by(sca_name: "Gailen Alric Ros") do |user|
       user.email = "mstrgailenalricros@gmail.com"
       user.password = "xqtz05LY"
       user.modern_name = "Perry Dyer"
    end
    u161 = User.find_for_authentication(email: "mstrgailenalricros@gmail.com") unless u161.valid?
    p161 = Peer.create(user: u161, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-08-23"), active: true, vigilant: false, bio: "")
    p161.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/308.png'), filename: '308.png', content_type: 'images/png');
    u162 = User.find_or_create_by(sca_name: "Rose Marian of Edgewater") do |user|
       user.email = "masanger17@gmail.com"
       user.password = "KS9t1dRr"
       user.modern_name = "Mary Sanger"
    end
    u162 = User.find_for_authentication(email: "masanger17@gmail.com") unless u162.valid?
    unless u162.arms.attached?
      u162.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/157.gif'), filename: '157.gif', content_type: 'images/gif');
    end
    p162 = Peer.create(user: u162, type: 'Pelican', elevated_by: "Christopher & Maurya I, King and Queen of Aethelmearc", elevation_date: Date.parse("1998-09-12"), active: true, vigilant: false, bio: "Companion of the Silver Crescent (Service) (East); Keystone (Service)(Principality of Aethelmearc),  Sycamore (A&S award) (Principality of Aethelmearc), Companion of the Millrind w/GoA (Service)(Kingdom of Aethelmearc), Companion of the Pelican (Kingdom of Aethelmearc); Northern Cross (Service)(Principality of Northshield-order closed at kingdom elevation), Companion of Bridget\'s Flame w/GoA (A&S award) (Kingdom of Northshield)  Kingdom borders have moved where I\'ve lived, and I\'ve moved as well. I\'ve been at 3 First Coronations, Aethelmearc\'s, Ealdormere\'s (I lived across the river at the time), and Northshield\'s.")
    p162.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/157.png'), filename: '157.png', content_type: 'images/png');
    u163 = User.find_or_create_by(sca_name: "Aidan Blackstone") do |user|
       user.email = "david.young1@louisville.edu"
       user.password = "pGAHYQ3U"
       user.modern_name = "David A. Young"
    end
    u163 = User.find_for_authentication(email: "david.young1@louisville.edu") unless u163.valid?
    unless u163.arms.attached?
      u163.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/159.gif'), filename: '159.gif', content_type: 'images/gif');
    end
    p163 = Peer.create(user: u163, type: 'Pelican', elevated_by: "TRM's Edmund and Katerine", elevation_date: Date.parse("2000-12-02"), active: true, vigilant: false, bio: "Aiden was put on vigil at Crown Tournament on October 21, 2000 and was elevated into the Order of the Pelican at the Christmas Tourney in Flame on December 2, 2000.")
    p163.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/159.png'), filename: '159.png', content_type: 'images/png');
    u164 = User.find_or_create_by(sca_name: "Aidan Morgana Evans") do |user|
       user.email = "pelican164@example.com"
       user.password = "6yfvsncT"
       user.modern_name = ""
    end
    u164 = User.find_for_authentication(email: "pelican164@example.com") unless u164.valid?
    p164 = Peer.create(user: u164, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u165 = User.find_or_create_by(sca_name: "Isaac de Hugo") do |user|
       user.email = "avorder@stcloudstate.edu"
       user.password = "TUh2NzoI"
       user.modern_name = "Andrew Vorder Bruegge"
    end
    u165 = User.find_for_authentication(email: "avorder@stcloudstate.edu") unless u165.valid?
    p165 = Peer.create(user: u165, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u166 = User.find_or_create_by(sca_name: "Alice of Kent") do |user|
       user.email = "p-a@execpc.com"
       user.deceased = true,
       user.password = "86II1OLU"
       user.modern_name = "Barbara Kearns"
    end
    u166 = User.find_for_authentication(email: "p-a@execpc.com") unless u166.valid?
    p166 = Peer.create(user: u166, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2000-12-09"), active: false, vigilant: false, bio: "")
    p166.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/162.png'), filename: '162.png', content_type: 'images/png');
    u167 = User.find_or_create_by(sca_name: "Antonio de Casa d'Aqua") do |user|
       user.email = "pelican167@example.com"
       user.deceased = true,
       user.password = "lB4W4ybR"
       user.modern_name = ""
    end
    u167 = User.find_for_authentication(email: "pelican167@example.com") unless u167.valid?
    p167 = Peer.create(user: u167, type: 'Pelican', elevated_by: "Edmund and Kateryn", elevation_date: Date.parse("2000-12-09"), active: false, vigilant: false, bio: "")
    p167.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/165.png'), filename: '165.png', content_type: 'images/png');
    u168 = User.find_or_create_by(sca_name: "Cassandra Antonelli") do |user|
       user.email = "hlcassandra@charter.net"
       user.password = "Y76zWMeM"
       user.modern_name = "Lee Norton"
    end
    u168 = User.find_for_authentication(email: "hlcassandra@charter.net") unless u168.valid?
    unless u168.arms.attached?
      u168.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/166.gif'), filename: '166.gif', content_type: 'images/gif');
    end
    p168 = Peer.create(user: u168, type: 'Pelican', elevated_by: "Edmund and Kateryn III", elevation_date: Date.parse("2001-04-21"), active: false, vigilant: false, bio: "")
    p168.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/166.png'), filename: '166.png', content_type: 'images/png');
    u169 = User.find_or_create_by(sca_name: "Julio Galva'n") do |user|
       user.email = "julio@gwtc.net"
       user.password = "8MQing3g"
       user.modern_name = "James Kruse"
    end
    u169 = User.find_for_authentication(email: "julio@gwtc.net") unless u169.valid?
    unless u169.arms.attached?
      u169.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/167.gif'), filename: '167.gif', content_type: 'images/gif');
    end
    p169 = Peer.create(user: u169, type: 'Pelican', elevated_by: "TRM's Bardolph and Brigh", elevation_date: Date.parse("2001-07-14"), active: false, vigilant: false, bio: " **Middle Kingdom Awards**  
 Award of Arms (September 9, 1995)   
 Order of the Cavendish Knot (July 12, 1997)   
 Order of the Dragon's Heart (November 15, 1997)   
 Order of the Bronze Ring (June 9, 2001)   
 Order of the Pelican (July 14, 2001)  
  
**Northshield Principality Awards**   
 Order of the Griffon Sheriff      - co-Premier (June 1, 1996)   
 Order of the Stellar Constable (July 11, 1998)   
 Order of the Northern Cross (May 22, 1999)   
 Order of the Eisenwache (September 16, 2000)  
 Order of the Commanders of the Iron Watch      - co-Premier (May 4th, 2002)  
 Scroll of Honor (May 4th, 2002)  
  
**Other notables**  
 Founding member of the Shires of Trewint & Coldedernhale  
 Co-autocrat of the first Quest for Camelot  
 First Principality Rapier Marshal of Northshield  
 Third Principality Earl Marshal of Northshield  
 Served in four groups-      Trewint      Coldedernhale      Schattentor      & Western Keep.  
 Former or current local Seneschal, Exchequer, Web Minister,      Chronicler, Knight Marshal, as well Rapier Marshal.")
    p169.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/167.png'), filename: '167.png', content_type: 'images/png');
    u170 = User.find_or_create_by(sca_name: "Joan of Caernarvon") do |user|
       user.email = "MarthaDay@att.net"
       user.password = "5eaFPmqR"
       user.modern_name = "Martha M. Day"
    end
    u170 = User.find_for_authentication(email: "MarthaDay@att.net") unless u170.valid?
    p170 = Peer.create(user: u170, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u171 = User.find_or_create_by(sca_name: "Midair MacCormaic") do |user|
       user.email = "charlesmidair@gmail.com"
       user.password = "3dV3l3jC"
       user.modern_name = "Charles Cohen"
    end
    u171 = User.find_for_authentication(email: "charlesmidair@gmail.com") unless u171.valid?
    unless u171.arms.attached?
      u171.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/169.gif'), filename: '169.gif', content_type: 'images/gif');
    end
    p171 = Peer.create(user: u171, type: 'Pelican', elevated_by: "Ragnvaldr and Arabella", elevation_date: Date.parse("2001-09-22"), active: true, vigilant: false, bio: "Charles J. Cohen, Ph.D.  3405 Brentwood Court  Ann Arbor, MI 48108  charlesmidair@gmail.com  Service Interests: Seneschal, Armored Combat, Exchequer, running  events, organization, supporting the performance arts, and having  fun!")
    p171.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/169.png'), filename: '169.png', content_type: 'images/png');
    u172 = User.find_or_create_by(sca_name: "Dore van der Zee") do |user|
       user.email = "kgomm@uwm.edu"
       user.password = "hWSYSnCI"
       user.modern_name = "Kathryn Gomm"
    end
    u172 = User.find_for_authentication(email: "kgomm@uwm.edu") unless u172.valid?
    unless u172.arms.attached?
      u172.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/170.gif'), filename: '170.gif', content_type: 'images/gif');
    end
    p172 = Peer.create(user: u172, type: 'Pelican', elevated_by: "Brigh and Bardolph", elevation_date: Date.parse("2001-08-17"), active: false, vigilant: false, bio: "")
    p172.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/170.png'), filename: '170.png', content_type: 'images/png');
    u173 = User.find_or_create_by(sca_name: "Winifred Corbet de Wynterwoode") do |user|
       user.email = "mgoodell1@charter.net"
       user.password = "UgIXqewL"
       user.modern_name = "Marsha Goodell"
    end
    u173 = User.find_for_authentication(email: "mgoodell1@charter.net") unless u173.valid?
    p173 = Peer.create(user: u173, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u174 = User.find_or_create_by(sca_name: "Orfhlaith Broinnfind nic Bhriain") do |user|
       user.email = "pelican174@example.com"
       user.password = "xZZvMwK1"
       user.modern_name = "Peggy Sue OBrien"
    end
    u174 = User.find_for_authentication(email: "pelican174@example.com") unless u174.valid?
    p174 = Peer.create(user: u174, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("1999-05-23"), active: false, vigilant: false, bio: "")
    u175 = User.find_or_create_by(sca_name: "Eleanor Isabeau du Coeur") do |user|
       user.email = "chirurgeon@att.net"
       user.password = "LeXVt66H"
       user.modern_name = "Beth Hart-Carlock"
    end
    u175 = User.find_for_authentication(email: "chirurgeon@att.net") unless u175.valid?
    p175 = Peer.create(user: u175, type: 'Pelican', elevated_by: "Alasdair and Guenievre", elevation_date: Date.parse("2003-12-06"), active: false, vigilant: false, bio: "")
    u176 = User.find_or_create_by(sca_name: "Idonia Tait") do |user|
       user.email = "idonia@peer.sca.org"
       user.password = "b2evGknX"
       user.modern_name = "Susan Tatreaux"
    end
    u176 = User.find_for_authentication(email: "idonia@peer.sca.org") unless u176.valid?
    unless u176.arms.attached?
      u176.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/173.gif'), filename: '173.gif', content_type: 'images/gif');
    end
    p176 = Peer.create(user: u176, type: 'Pelican', elevated_by: "Ragnvaldr and Arabella", elevation_date: Date.parse("2001-12-08"), active: false, vigilant: false, bio: "     Idonia's page of information!   Member since: 1980 (I think)   Lived in: Midrealm, Ansteorra,  Northshield   Current office: Local chronicler,  Caer Anterth Mawr.   Other current responsibilities:  Royalty liaison for Caer Anterth  Mawr's 25th anniversary in  October 2004   Protege: Baroness Kateryn of  Cornwall   General areas of emphasis in  service: Event stewardship,  local and regional  (principality, kingdom)  newsletters, holding office.   Other areas of interest:  Bardic arts.")
    p176.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/173.png'), filename: '173.png', content_type: 'images/png');
    u177 = User.find_or_create_by(sca_name: "Brannos O'Irongardail") do |user|
       user.email = "brannos@safeville.com"
       user.password = "9KnEoTi0"
       user.modern_name = "Matthew Muller"
    end
    u177 = User.find_for_authentication(email: "brannos@safeville.com") unless u177.valid?
    unless u177.arms.attached?
      u177.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/174.gif'), filename: '174.gif', content_type: 'images/gif');
    end
    p177 = Peer.create(user: u177, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2002-01-05"), active: true, vigilant: false, bio: "")
    p177.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/174.png'), filename: '174.png', content_type: 'images/png');
    u178 = User.find_or_create_by(sca_name: "Timothy O'Byrne") do |user|
       user.email = "tbyrnes883@sbcglobal.net"
       user.password = "gIoSkBlm"
       user.modern_name = "Tim Byrnes"
    end
    u178 = User.find_for_authentication(email: "tbyrnes883@sbcglobal.net") unless u178.valid?
    unless u178.arms.attached?
      u178.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/180.gif'), filename: '180.gif', content_type: 'images/gif');
    end
    p178 = Peer.create(user: u178, type: 'Pelican', elevated_by: "Valharic I and Alys I", elevation_date: Date.parse("2002-05-25"), active: false, vigilant: false, bio: "")
    p178.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/180.png'), filename: '180.png', content_type: 'images/png');
    u179 = User.find_or_create_by(sca_name: "Bridget ni Cathasaigh") do |user|
       user.email = "jean_qd@hotmail.com"
       user.password = "av7EiRpl"
       user.modern_name = "Jean Quinn-Davis"
    end
    u179 = User.find_for_authentication(email: "jean_qd@hotmail.com") unless u179.valid?
    unless u179.arms.attached?
      u179.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/176.gif'), filename: '176.gif', content_type: 'images/gif');
    end
    p179 = Peer.create(user: u179, type: 'Pelican', elevated_by: "Alys Katherine & Valharic", elevation_date: Date.parse("2002-05-04"), active: false, vigilant: false, bio: "     Prefers \"Baroness Bridget\" or \"Dame Bridget\". Joined SCA in November 1981. 2nd Baroness of Nordskogen, 1985-1994. Have been baronial exchequer, chatelaine, pursuivant, seneschal pro tem. Dabbles in many things OR knows a little about a lot OR has many interests (take your pick): Costuming, needlework, calligraphy & illumination, Middle-Eastern dancing, blown glass, pottery, bead-making, armored fighting, heraldry, protocol, singing, A&S Tally room, Elizabeth I, etc. Can be a bit of a Policy wonk. Likes ice cream that comes in buckets.")
    p179.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/176.png'), filename: '176.png', content_type: 'images/png');
    u180 = User.find_or_create_by(sca_name: "Lars Vilhjalmsson") do |user|
       user.email = "blackmug@midusa.net"
       user.password = "1JGdIZbW"
       user.modern_name = "Larry Brow"
    end
    u180 = User.find_for_authentication(email: "blackmug@midusa.net") unless u180.valid?
    p180 = Peer.create(user: u180, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u181 = User.find_or_create_by(sca_name: "Phillip the Pilgrim") do |user|
       user.email = "phil@moyen.org"
       user.password = "AU1j4wM7"
       user.modern_name = "Phillip Reed"
    end
    u181 = User.find_for_authentication(email: "phil@moyen.org") unless u181.valid?
    unless u181.arms.attached?
      u181.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/178.gif'), filename: '178.gif', content_type: 'images/gif');
    end
    p181 = Peer.create(user: u181, type: 'Pelican', elevated_by: "Valharic and Alys Katherine", elevation_date: Date.parse("2002-06-29"), active: true, vigilant: false, bio: "Order of the Pelican -- June 29, 2002 (A.S. 37)  
 Baron of the Court of William and Isolde -- September 23, 2017 (A.S. 52)  
 Order of the Dragon\'s Heart -- October 16, 1982 (A.S. 17)  
 Award of the Purple Fret -- 12 Jul, 2008 (A.S. 43)  
 Order of the Silver Oak (brewing) -- February 6, 1993 (A.S. 27)  
 Award of Arms -- Jan 10, 1981 (A.S. 15)")
    p181.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/178.png'), filename: '178.png', content_type: 'images/png');
    u182 = User.find_or_create_by(sca_name: "Justinos Tekton") do |user|
       user.email = "justin@4th.com"
       user.password = "OTvVuuwe"
       user.modern_name = "Scott Courtney"
    end
    u182 = User.find_for_authentication(email: "justin@4th.com") unless u182.valid?
    unless u182.arms.attached?
      u182.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/179.gif'), filename: '179.gif', content_type: 'images/gif');
    end
    p182 = Peer.create(user: u182, type: 'Pelican', elevated_by: "TRM Valharic and Alys", elevation_date: Date.parse("2002-08-15"), active: true, vigilant: false, bio: "In the Current Middle Ages, Maistor Justinos Tekton called Justin is a Byzantine from the early 11th Century. With his wife, Milica of Varna, Justin now travels (using his English name) in western Europe, living off money he made as a designer of aqueducts and sewers in Constantinople and from a small income as an itinerant tinker. Justin enjoys archery, woodworking, and theatrical arts, and has spent some time learning the skills of combat as well. Roads in Europe are sometimes dangerous, after all! Justin has had the pleasure of serving as Seneschal at local, regional, and deputy kingdom levels, and as a Master/Mentor Chirurgeon.

In the modern world, Scott Courtney is a Principal Engineer who works for a consulting company specializing in Linux on IBM mainframes and other large-scale Open Source deployments. He has completed several projects in the People's Republic of China, working with local telecommunications businesses to improve their IT systems, and he has over two dozen technical articles published online and in print.

Justin lives in the Marche of Alderford, modernly known as Canton, Ohio, USA. His SCA-related web site is at[http://sca.4th.com/justin](http://sca.4th.com/justin).")
    p182.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/179.png'), filename: '179.png', content_type: 'images/png');
    u183 = User.find_or_create_by(sca_name: "Sigulf Karlnar") do |user|
       user.email = "mastersigulf@gmail.com"
       user.password = "FhkGlSjG"
       user.modern_name = "Richard W. Pierson"
    end
    u183 = User.find_for_authentication(email: "mastersigulf@gmail.com") unless u183.valid?
    unless u183.arms.attached?
      u183.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/181.gif'), filename: '181.gif', content_type: 'images/gif');
    end
    p183 = Peer.create(user: u183, type: 'Pelican', elevated_by: "Valharic & Alys Katharine", elevation_date: Date.parse("2002-07-27"), active: true, vigilant: false, bio: "     Placed on Vigil at Crown Tournament on May 25,2002 and elevated into the Order of the Pelican on July 27, 2002 at A Simple Day in the Country in Sternfeld.  The women in the picture are my proteges: Solveig Sigulfsdottir (on my right) & Maggie McKeith (on my left).")
    p183.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/181.png'), filename: '181.png', content_type: 'images/png');
    u184 = User.find_or_create_by(sca_name: "Susan O'Dell") do |user|
       user.email = "Baronesssusan@msn.com"
       user.password = "wHeJaLJe"
       user.modern_name = "Suellen Odell"
    end
    u184 = User.find_for_authentication(email: "Baronesssusan@msn.com") unless u184.valid?
    p184 = Peer.create(user: u184, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2002-07-27"), active: true, vigilant: false, bio: "")
    p184.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/182.png'), filename: '182.png', content_type: 'images/png');
    u185 = User.find_or_create_by(sca_name: "Galen of Bristol") do |user|
       user.email = "sirgalen@gmail.com"
       user.password = "Px7XXwYd"
       user.modern_name = "Paul Mitchell"
    end
    u185 = User.find_for_authentication(email: "sirgalen@gmail.com") unless u185.valid?
    unless u185.arms.attached?
      u185.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/183.gif'), filename: '183.gif', content_type: 'images/gif');
    end
    p185 = Peer.create(user: u185, type: 'Pelican', elevated_by: "Kein II & Alisha II of Ansteorra", elevation_date: Date.parse("1997-09-27"), active: true, vigilant: false, bio: "Galen of Bristol grew up in Galesburg, IL, and joined the SCA in Meridies' Barony of Grey Niche (Memphis, TN) in May of 1979 (A.S. XIV). He has lived in Ansteorra, Drachenwald (where he ruled as Prince and founded the Shire of Perilous Journey in West Berlin), and Ansteorra again (where he was made a knight in 1987, served as Kingdom Seneschal, autocratted numerous events including Ansteorra's 20th Year Celebration, and was made a Pelican in 1997. He served as Baron of the Barony of Elfsea before moving, in the middle of 2002, to the Shire of Raven's Lake, in the Region of the Midlands.")
    p185.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/183.png'), filename: '183.png', content_type: 'images/png');
    u186 = User.find_or_create_by(sca_name: "Lothair von Drachenstein") do |user|
       user.email = "blindman@dragonsjewels.com"
       user.password = "Pj7xwA8Z"
       user.modern_name = "Frank DeRosa"
    end
    u186 = User.find_for_authentication(email: "blindman@dragonsjewels.com") unless u186.valid?
    unless u186.arms.attached?
      u186.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/184.gif'), filename: '184.gif', content_type: 'images/gif');
    end
    p186 = Peer.create(user: u186, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2002-08-16"), active: true, vigilant: false, bio: "")
    p186.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/184.png'), filename: '184.png', content_type: 'images/png');
    u187 = User.find_or_create_by(sca_name: "Wulfgang von den Lowen") do |user|
       user.email = "sirwulf@mb.sympatico.ca"
       user.password = "IrdcdsKs"
       user.modern_name = "Frederick Janz"
    end
    u187 = User.find_for_authentication(email: "sirwulf@mb.sympatico.ca") unless u187.valid?
    unless u187.arms.attached?
      u187.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/185.gif'), filename: '185.gif', content_type: 'images/gif');
    end
    p187 = Peer.create(user: u187, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    p187.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/185.png'), filename: '185.png', content_type: 'images/png');
    u188 = User.find_or_create_by(sca_name: "Richard Morgan of Cumberland") do |user|
       user.email = "rickandjean@itasca.net"
       user.password = "7K9FGJtV"
       user.modern_name = "Rick Darnell"
    end
    u188 = User.find_for_authentication(email: "rickandjean@itasca.net") unless u188.valid?
    p188 = Peer.create(user: u188, type: 'Pelican', elevated_by: "Valharic and Alys", elevation_date: Date.parse("2002-07-13"), active: false, vigilant: false, bio: "")
    u189 = User.find_or_create_by(sca_name: "Ixtilixochitl") do |user|
       user.email = "ix@terraefinis.org"
       user.password = "dxGOOa3S"
       user.modern_name = "Bo Ring"
    end
    u189 = User.find_for_authentication(email: "ix@terraefinis.org") unless u189.valid?
    unless u189.arms.attached?
      u189.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/187.gif'), filename: '187.gif', content_type: 'images/gif');
    end
    p189 = Peer.create(user: u189, type: 'Pelican', elevated_by: "Valhalric and Alys Kathrin", elevation_date: Date.parse("2002-08-13"), active: true, vigilant: false, bio: "")
    p189.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/187.png'), filename: '187.png', content_type: 'images/png');
    u190 = User.find_or_create_by(sca_name: "Chai'usun") do |user|
       user.email = "chaiusun@gmail.com"
       user.password = "4P1KsEAW"
       user.modern_name = "Jana Russ"
    end
    u190 = User.find_for_authentication(email: "chaiusun@gmail.com") unless u190.valid?
    unless u190.arms.attached?
      u190.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/188.gif'), filename: '188.gif', content_type: 'images/gif');
    end
    p190 = Peer.create(user: u190, type: 'Pelican', elevated_by: "Valhalric & Alys Katherine", elevation_date: Date.parse("2002-08-15"), active: true, vigilant: false, bio: "Twitter:  
[http://twitter.com/janaruss](http://twitter.com/janaruss)

 

Blog: [http://cuppachai.blogspot.com](http://cuppachai.blogspot.com)")
    p190.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/188.png'), filename: '188.png', content_type: 'images/png');
    u191 = User.find_or_create_by(sca_name: "Elina of Beckenham") do |user|
       user.email = "duchesselina@beckenham.org"
       user.password = "k5kdYOUa"
       user.modern_name = "Tobi Beck"
    end
    u191 = User.find_for_authentication(email: "duchesselina@beckenham.org") unless u191.valid?
    p191 = Peer.create(user: u191, type: 'Pelican', elevated_by: "Havoc & Ginevera", elevation_date: Date.parse("2002-01-04"), active: true, vigilant: false, bio: "I am Elina of Beckenham, a Pelican of the Society, elevated in the West. I have been a member of the Society since January 5, 1980 where I attended my first event. In that time I have participated in the birth of a kingdom, held offices of all flavors and enjoyed the society and it's members in the eight kingdoms I have lived in.

If you ask me to quantify what it is that made me a Pelican, I can not say.  I enjoy helping and ensuring that the world we live in gets better every day. Service, as far as I can tell, should be a natural thing, something you do, as comfortably as you breath. 

Please introduce yourself to me, should you have the chance. I look forward to meeting you.

Duchess Elina of Beckenham

- Duchess Apr 27, AS XXX (1996) Alden & Madeline (West) 

- Countess Mar 10, AS XXIV (1990) Trimaris 

- Viscountess Nov 16, AS XXXVII (2002) Bryne & Brand (Mists) 

- Laurel Mar 5, AS XXII (1988) Trimaris 

- Order of the Rose Mar 10, AS XXIV (1990) Trimaris 

- Pelican Jan 5, AS XXXVI (2002) Hauoc & Ginevra (West) 

- Triskele Trimaris \* Unknown \* Trimaris 
- Grant of Arms, Jan 4, AS XXXVII (2003) Connor & Isa

- Silver Trident Trimaris Oct 24, AS XXII (1987) 

- Trimaris Western Lily Sep 25, AS XXXVII (2002) Thorfinn & Cyneswith (West) 

- Leaf of Merit Aug 16, AS XXXVI (2001) Fabian & Susan (West) 
- Order of the Kings Lance Nov AS XXXVII (2002) Thorfin & Cyneswith
- Order of the Gold Mace Feb 15 AS XXXVII (2003) Tarrich (Middle)

- Award of Arms May 29, AS XVII (1982) Trimaris 

- Commendabilis Jun 20, AS XXXIII (1998) Hauoc & Etaine (West) 

- Commendabilis Oct 3, AS XXXIII (1998) Jade & Siobhan (West) 

- Golden Poppy Jan 3, AS XXXII (1998) Fabian & Brynn (West) 

- Order of Valor Mar 22, AS XXXI (1997) Cybi & Victoria (West) 

- Emerald Seas May 29, AS XVII (1982) Trimaris 

- Sovereign's Pleasure Nov 10, AS XIX (1984) Meridies 

- Queen's Cypher Aug 22, AS XXVII (1992) Shaheena (West) 

- Queen's Cypher May 1, AS XXVIII (1993) Shaheena (West) 

- Queen's Cypher Jan 7, AS XXIX (1995) Gabriel (West) 

- Queen's Cypher Apr 29, AS XXIX (1995) Cyneswith (West) 

- Queen's Cypher Jan 3, AS XXXII (1998) Tanwen (West) 

- Queen's Cypher May 2, AS XXXIII (1998) Brynn (West) 

- Queen's Cypher Apr 29, AS XXXIV (2000) Brynn (West) 

- Queen's Cypher Jan 6, AS XXXV (2001) Osa (West) 

- Queen's Cypher Jan 5, AS XXXVI (2002) Ginevra (West) 

- Queen's Guard Jan 7, AS XXIX (1995) Cyneswith (West) 

- Queen's Guard Aug 25, AS XXXVI (2001) Ginevra (West) 

- Pied d'Argent Oct 3, AS XXXII (1997) Uther & Tanwen (West) 

- Defender of the West Apr 10, AS XXXIII (1999) Garick & Talitha (West) 

- Defender of the West Aug 17, AS XXXV (2000) Jade & Siobhan (West) 

- Meridian Cross \* Unknown \* Meridies 

- Rainbow Argent Aug 30, AS XXI (1986) 

- Trimaris Black Widow Mar 9, AS XXV (1991)
- Companion of the Red Company, Feb 15 XXXVII (2003) Tarich (Middle) 

- Trimaris Corolla Muralis Mar 8, AS XXXI (1997) Leon & Kiriana (Mists) 

- Corolla Aulica May 19, AS XXXVI (2001) Brion & Shaheena (Mists) 

- Dames de la Mer Nov 16, AS XXXVII (2002) Bryne & Brand (Mists) 

- Princess' Favor May 6, AS XXX (1995) Elisabeth (Mists) 

- Princess' Favor May 17, AS XXXII (1997) Kiriana (Mists) 

- Princess' Favor May 13, AS XXXV (2000) Ceara (Mists) 

- Princess' Escort (Mists) Jul 6, AS XXXI (1996) Sely (Mists) 

- Princess' Escort (Mists) Nov 23, AS XXXI (1996) Kiriana (Mists) 

- Princess' Guard Nov 18, AS XXXV (2000) Shaheena (Mists) 

- Prince's Lance Apr 28, AS XXXV (2001) Brion (Mists) 

- Cynaguan Medal of Honor Nov 14, AS XXXIII (1998) Falan & Denise (Cynagua)")
    p191.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/189.png'), filename: '189.png', content_type: 'images/png');
    u192 = User.find_or_create_by(sca_name: "Sean o'Shaughnessy") do |user|
       user.email = "tomhughes0001@gmail.com"
       user.password = "4R1KUypo"
       user.modern_name = "Tom Hughes"
    end
    u192 = User.find_for_authentication(email: "tomhughes0001@gmail.com") unless u192.valid?
    unless u192.arms.attached?
      u192.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/190.gif'), filename: '190.gif', content_type: 'images/gif');
    end
    p192 = Peer.create(user: u192, type: 'Pelican', elevated_by: "Tarrach and Fina", elevation_date: Date.parse("2003-02-01"), active: true, vigilant: false, bio: "")
    p192.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/190.png'), filename: '190.png', content_type: 'images/png');
    u193 = User.find_or_create_by(sca_name: "Kenna Harve") do |user|
       user.email = "pelican193@example.com"
       user.password = "sXLPMlNO"
       user.modern_name = "Kim Harvey"
    end
    u193 = User.find_for_authentication(email: "pelican193@example.com") unless u193.valid?
    p193 = Peer.create(user: u193, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2003-06-28"), active: true, vigilant: false, bio: "")
    u194 = User.find_or_create_by(sca_name: "Vorlin o'r Gwig") do |user|
       user.email = "master_vorlin@yahoo.com"
       user.password = "Ev6AyO7G"
       user.modern_name = "Gary Shurgin"
    end
    u194 = User.find_for_authentication(email: "master_vorlin@yahoo.com") unless u194.valid?
    unless u194.arms.attached?
      u194.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/192.gif'), filename: '192.gif', content_type: 'images/gif');
    end
    p194 = Peer.create(user: u194, type: 'Pelican', elevated_by: "Tarrach and Fina", elevation_date: Date.parse("2003-04-05"), active: true, vigilant: false, bio: "")
    u195 = User.find_or_create_by(sca_name: "Charles Oakley") do |user|
       user.email = "jrwinkler@msn.com"
       user.password = "BKGAYlle"
       user.modern_name = "James R. Winkler"
    end
    u195 = User.find_for_authentication(email: "jrwinkler@msn.com") unless u195.valid?
    unless u195.arms.attached?
      u195.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/193.gif'), filename: '193.gif', content_type: 'images/gif');
    end
    p195 = Peer.create(user: u195, type: 'Pelican', elevated_by: "TRM Tarrach and Fina", elevation_date: Date.parse("2003-04-12"), active: false, vigilant: false, bio: " **_Past jobs:_**

- Baronial MOS
- Baronial Chronicler
- Regional (Midlands) Chronicler
- Drop-Dead Pale Editor
- Adjutant to the KMOAS
- Publisher of Autocrat's Daily (Pennsic)
- Kingdom Minister of Arts and Sciences 
- Special Deputy to the Kingdom Seneschal
- Deputy to Deputy for Parking (Pennsic) 
- Vicar of Wurm Wald 
- Kingdom Seneschal of the Midrealm

**_Current:_**

- Deputy to the Kingdom Seneschal")
    p195.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/193.png'), filename: '193.png', content_type: 'images/png');
    u196 = User.find_or_create_by(sca_name: "Ian the Fariner of Dunkeld") do |user|
       user.email = "gideon@neei.com"
       user.password = "4LOktP2w"
       user.modern_name = "Lew Newby"
    end
    u196 = User.find_for_authentication(email: "gideon@neei.com") unless u196.valid?
    unless u196.arms.attached?
      u196.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/194.gif'), filename: '194.gif', content_type: 'images/gif');
    end
    p196 = Peer.create(user: u196, type: 'Pelican', elevated_by: "Uther and Portia (West)", elevation_date: Date.parse("2002-01-04"), active: false, vigilant: false, bio: "")
    u197 = User.find_or_create_by(sca_name: "Elspeth the Semstress of Dunkeld") do |user|
       user.email = "Elspeth.OP@gmail.com"
       user.password = "uEmXX77Y"
       user.modern_name = ""
    end
    u197 = User.find_for_authentication(email: "Elspeth.OP@gmail.com") unless u197.valid?
    unless u197.arms.attached?
      u197.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/195.gif'), filename: '195.gif', content_type: 'images/gif');
    end
    p197 = Peer.create(user: u197, type: 'Pelican', elevated_by: "Fabian and Susan (West)", elevation_date: Date.parse("2001-04-28"), active: false, vigilant: false, bio: "")
    u198 = User.find_or_create_by(sca_name: "Brise Sanguine") do |user|
       user.email = "brisesanguin@yahoo.com"
       user.password = "LP2jLIV1"
       user.modern_name = "Kendra Maurer"
    end
    u198 = User.find_for_authentication(email: "brisesanguin@yahoo.com") unless u198.valid?
    p198 = Peer.create(user: u198, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2004-01-17"), active: true, vigilant: false, bio: "")
    u199 = User.find_or_create_by(sca_name: "Alexander de Seton") do |user|
       user.email = "AlexdeSet@aol.com"
       user.password = "6PBCGPXF"
       user.modern_name = "John Seaton"
    end
    u199 = User.find_for_authentication(email: "AlexdeSet@aol.com") unless u199.valid?
    unless u199.arms.attached?
      u199.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/197.gif'), filename: '197.gif', content_type: 'images/gif');
    end
    p199 = Peer.create(user: u199, type: 'Pelican', elevated_by: "Pieter and Nan Astrid", elevation_date: Date.parse("2003-09-06"), active: true, vigilant: false, bio: "PROTEGES (Held in common with Mistress Maggie of Cnoc Cait)

Metylda nic Lachlainn, Kveldulf Skallagrimsson, Kenwrec Wulfe, Kai Tseng, Baroness Malie MacAoidh.

(Henchmen) Warder Stephan Montague, Baroness Malie MacAoidh\<  (Student) Lord Finn O\'Connor /p\>

Ask me to teach, or ask for a copy of Master Alexander\'s Little Boke of Heat and Light")
    p199.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/197.png'), filename: '197.png', content_type: 'images/png');
    u200 = User.find_or_create_by(sca_name: "Katalena Ivaniaia zhena Shishova") do |user|
       user.email = "katalenaivaniaia@gmail.com"
       user.password = "REOwLwao"
       user.modern_name = "Erin Potter"
    end
    u200 = User.find_for_authentication(email: "katalenaivaniaia@gmail.com") unless u200.valid?
    unless u200.arms.attached?
      u200.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/363.gif'), filename: '363.gif', content_type: 'images/gif');
    end
    p200 = Peer.create(user: u200, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2018-01-27"), active: true, vigilant: false, bio: "Katalena Ivaniaia is a 12th century Englishwoman who lives in Novgorod with her husband, a member of the Kievan Prince\'s druzhina. She focuses on the management of their holdings in the city as well as in the countryside.

When not managing the estates and business interests, Katalena focuses her energies on the creation of clothing from beginning to end - spinning, weaving, dyeing and printing, and construction. Her efforts focus on the clothing appropriate to the time and place in which she and her family live.

Within our organization, I have been an exchequer, pursuivant, event steward, and equestrian marshal as well as taking on other management-type tasks. My strengths and joy is found in managing and organizing so that others can enjoy themselves.

Co-founder of the household Two Tygers Keep and allied with the households of Wyvern Gaard and Lion and Lotus.")
    p200.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/363.png'), filename: '363.png', content_type: 'images/png');
    u201 = User.find_or_create_by(sca_name: "Maggie of Cnoc Cait") do |user|
       user.email = "cnoccait@gmail.com"
       user.password = "uqJ951s1"
       user.modern_name = "Deborah Seaton"
    end
    u201 = User.find_for_authentication(email: "cnoccait@gmail.com") unless u201.valid?
    p201 = Peer.create(user: u201, type: 'Pelican', elevated_by: "Pieter and Nan Astrid", elevation_date: Date.parse("2003-09-06"), active: true, vigilant: false, bio: "")
    p201.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/198.png'), filename: '198.png', content_type: 'images/png');
    u202 = User.find_or_create_by(sca_name: "Norinna O'Shaughnessy") do |user|
       user.email = "dragonflyvert@yahoo.com"
       user.password = "nXwdKv7S"
       user.modern_name = "Lori Bush"
    end
    u202 = User.find_for_authentication(email: "dragonflyvert@yahoo.com") unless u202.valid?
    unless u202.arms.attached?
      u202.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/199.gif'), filename: '199.gif', content_type: 'images/gif');
    end
    p202 = Peer.create(user: u202, type: 'Pelican', elevated_by: "Jade & Adina (West)", elevation_date: Date.parse("1999-10-02"), active: false, vigilant: false, bio: "     Pelican \* October 2, 1999 \* Jade & Adina (West) Grant of Arms \* March 22, 1997 \* Cybi & Victoria (West) Leaf of Merit \* October 12, 1996 \* Jade & Juana Isabella (West) Baroness \* August 24, 2002 \* Jade & Megan (West) Award of Arms \* May 8, 1993 \* Garick & Talitha (Principality of the Mists) Defender of the West \* August 17, 2000 \* Jade & Siobhan (West) Corolla Aulica \* September 20, 1997 \* Brand & Megan Brenna (Principality of the Mists) Den Grimme Aeling \* January 25, 2003 \* Cybi & Victoria (Principality of Cynagua) Queen's Cypher \* May 3, 1997 \* Victoria (West) Queen's Cypher \* January 25, 2002 \* Ginevra (West) Queen's Cypher \* August 24, 2002 \* Megan (West) Princess' Favor \* May 12, 1996 \* Eliza (Principality of the Mists) Princess' Favor \* November 15, 1997 \* Megan Brenna (Principality of the Mists) Princess' Favor \* November 21, 1998 \* Carinne (Principality of the Mists) Princess' Favor \* May 13, 2000 \* Ceara (Principality of the Mists) Princess' Token \* January 30, 1999 \* Denise (Principality of Cynagua) Princess' Token \* July 13, 2002 \* Mari (Principality of Cynagua)")
    u203 = User.find_or_create_by(sca_name: "Aaron Palomides of Buckminster") do |user|
       user.email = "rusty@rustmon.org"
       user.password = "jXMr3ET2"
       user.modern_name = "Aaron"
    end
    u203 = User.find_for_authentication(email: "rusty@rustmon.org") unless u203.valid?
    unless u203.arms.attached?
      u203.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/200.gif'), filename: '200.gif', content_type: 'images/gif');
    end
    p203 = Peer.create(user: u203, type: 'Pelican', elevated_by: "Hauoc and Ginevra (West)", elevation_date: Date.parse("2001-10-13"), active: false, vigilant: false, bio: "")
    p203.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/200.png'), filename: '200.png', content_type: 'images/png');
    u204 = User.find_or_create_by(sca_name: "Fiskr Hamondson") do |user|
       user.email = "fiskr@mato.com"
       user.password = "PZQ9OWal"
       user.modern_name = "Jon Larsen"
    end
    u204 = User.find_for_authentication(email: "fiskr@mato.com") unless u204.valid?
    p204 = Peer.create(user: u204, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u205 = User.find_or_create_by(sca_name: "Siobhan O'Neill") do |user|
       user.email = "pelican205@example.com"
       user.deceased = true,
       user.password = "iUVKkCfM"
       user.modern_name = "Judy Kirk"
    end
    u205 = User.find_for_authentication(email: "pelican205@example.com") unless u205.valid?
    unless u205.arms.attached?
      u205.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/203.gif'), filename: '203.gif', content_type: 'images/gif');
    end
    p205 = Peer.create(user: u205, type: 'Pelican', elevated_by: "Alistair and Guenievre", elevation_date: Date.parse("2004-02-14"), active: false, vigilant: false, bio: "")
    p205.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/203.png'), filename: '203.png', content_type: 'images/png');
    u206 = User.find_or_create_by(sca_name: "Galen of Ockham") do |user|
       user.email = "galen.of.ockham@gmail.com"
       user.password = "rmzMtqUS"
       user.modern_name = "Keith E. Brandt, MD, MPH"
    end
    u206 = User.find_for_authentication(email: "galen.of.ockham@gmail.com") unless u206.valid?
    unless u206.arms.attached?
      u206.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/204.gif'), filename: '204.gif', content_type: 'images/gif');
    end
    p206 = Peer.create(user: u206, type: 'Pelican', elevated_by: "Alasdair and Guenievre", elevation_date: Date.parse("2004-02-28"), active: false, vigilant: false, bio: "")
    p206.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/204.png'), filename: '204.png', content_type: 'images/png');
    u207 = User.find_or_create_by(sca_name: "Stephen of Beckenham") do |user|
       user.email = "pelican207@example.com"
       user.password = "xxkgkbf7"
       user.modern_name = "Steve Beck"
    end
    u207 = User.find_for_authentication(email: "pelican207@example.com") unless u207.valid?
    unless u207.arms.attached?
      u207.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/205.gif'), filename: '205.gif', content_type: 'images/gif');
    end
    p207 = Peer.create(user: u207, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2003-06-22"), active: true, vigilant: false, bio: "")
    p207.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/205.png'), filename: '205.png', content_type: 'images/png');
    u208 = User.find_or_create_by(sca_name: "Kassia Gildea") do |user|
       user.email = "thl_kassia@yahoo.com"
       user.password = "priiVo1b"
       user.modern_name = "Diane White"
    end
    u208 = User.find_for_authentication(email: "thl_kassia@yahoo.com") unless u208.valid?
    unless u208.arms.attached?
      u208.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/206.gif'), filename: '206.gif', content_type: 'images/gif');
    end
    p208 = Peer.create(user: u208, type: 'Pelican', elevated_by: "TRM Felix and Madeleina", elevation_date: Date.parse("2004-05-15"), active: false, vigilant: false, bio: "")
    p208.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/206.png'), filename: '206.png', content_type: 'images/png');
    u210 = User.find_or_create_by(sca_name: "Garth of the Crags") do |user|
       user.email = "pelican210@example.com"
       user.password = "DQ4CAks1"
       user.modern_name = "Craig White"
    end
    u210 = User.find_for_authentication(email: "pelican210@example.com") unless u210.valid?
    p210 = Peer.create(user: u210, type: 'Pelican', elevated_by: "Felix and Madeleina", elevation_date: Date.parse("2004-08-19"), active: false, vigilant: false, bio: "")
    p210.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/208.png'), filename: '208.png', content_type: 'images/png');
    u211 = User.find_or_create_by(sca_name: "Heirusalem Crystoma") do |user|
       user.email = "pipublisher@gmail.com"
       user.password = "Fjrx7qsl"
       user.modern_name = "Sarah Rogers"
    end
    u211 = User.find_for_authentication(email: "pipublisher@gmail.com") unless u211.valid?
    unless u211.arms.attached?
      u211.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/209.gif'), filename: '209.gif', content_type: 'images/gif');
    end
    p211 = Peer.create(user: u211, type: 'Pelican', elevated_by: "Brannos and Rebekah", elevation_date: Date.parse("2004-10-30"), active: true, vigilant: false, bio: "_Past Positions:_

- Baronial Chronicler: Barony of Sternfeld
- Regional Chronicler: Constellation
- Baronial Chronicler: Barony of Rivenstar
- Deputy Middle Kingdom Chronicler
- Rapier Marshal: Barony of Rivenstar  
- Middle Kingdom Chronicler  
- Publisher: The Pennsic War Chronicle
- Society Chronicler
- Web Minister: Barony of Rivenstar
- Middle Kingdom Chronicler redux

_Current Positions:_

Publisher: The Pennsic Independent _(not an SCA position)_

Heirusalem Crystoma was born to a wealthy noble family in the tin-mine rich area of northern Cornwall in 1152. As she grew, her business-minded family ensured her ability to read and write. She was lucky enough to be given the chance to travel, and her skill at writing allowed her to record those things she saw and the deeds of others in her travels. In her later years, she retired to her home to maintain the accounts of her family\'s business.

 

Sarah Rogers is an accountant and publisher of the world\'s smallest (and greatest) daily newspaper. She is currently pursuing a Master of Sciences in Accounting and the CPA designation. She is the proud mother of six and grandmother of six. She hopes to graduate someday and actually make some money. Her interests include researching the pipe rolls of medieval England, making jewelry, researching historic costume, sewing, and cooking. Her greatest treasures are her children and grandchildren.")
    p211.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/209.png'), filename: '209.png', content_type: 'images/png');
    u212 = User.find_or_create_by(sca_name: "Nicholaa Halden") do |user|
       user.email = "nhalden0001@gmail.com"
       user.password = "KDrxXHVB"
       user.modern_name = "Nora London"
    end
    u212 = User.find_for_authentication(email: "nhalden0001@gmail.com") unless u212.valid?
    unless u212.arms.attached?
      u212.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/210.gif'), filename: '210.gif', content_type: 'images/gif');
    end
    p212 = Peer.create(user: u212, type: 'Pelican', elevated_by: "Felix and Madeleina", elevation_date: Date.parse("2004-08-19"), active: true, vigilant: false, bio: "")
    p212.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/210.png'), filename: '210.png', content_type: 'images/png');
    u213 = User.find_or_create_by(sca_name: "Fina ingen Aeda") do |user|
       user.email = "brightandterribl@earthlink.net"
       user.password = "FEMKvOnz"
       user.modern_name = "Lorine Horvath"
    end
    u213 = User.find_for_authentication(email: "brightandterribl@earthlink.net") unless u213.valid?
    p213 = Peer.create(user: u213, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u214 = User.find_or_create_by(sca_name: "Katriona Gwen Fergus") do |user|
       user.email = "pelican214@example.com"
       user.password = "JhkPeBC4"
       user.modern_name = "Michele Adkins"
    end
    u214 = User.find_for_authentication(email: "pelican214@example.com") unless u214.valid?
    p214 = Peer.create(user: u214, type: 'Pelican', elevated_by: "Ronald & Dierdriana (West)", elevation_date: Date.parse("1984-07-14"), active: true, vigilant: false, bio: "")
    u215 = User.find_or_create_by(sca_name: "Gwenhwyvar Nocturnal") do |user|
       user.email = "c.wong.mccowin@gmail.com"
       user.password = "uE4jLrP2"
       user.modern_name = "Cynthia Wong McCowin"
    end
    u215 = User.find_for_authentication(email: "c.wong.mccowin@gmail.com") unless u215.valid?
    unless u215.arms.attached?
      u215.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/213.gif'), filename: '213.gif', content_type: 'images/gif');
    end
    p215 = Peer.create(user: u215, type: 'Pelican', elevated_by: "Alaric and Noelle", elevation_date: Date.parse("2005-09-17"), active: true, vigilant: false, bio: "    Order of the Laurel 31 Mar, 2007 (A.S. 41)   
    Order of the Pelican 17 Sep, 2005 (A.S. 40)  
    Order of the Dragon's Heart 22 Jun, 1996 (A.S. 31)  
    Order of the Evergreen 08 Mar, 2003 (A.S. 37)  
    Grant of Arms 20 Sep, 1997 (A.S. 32)  
    Order of the Willow 08 Jul, 1995 (A.S. 30)  
    Award of the Purple Fret 04 Jun, 1994 (A.S. 29)  
    Award of the Doe's Grace 28 Feb, 1998 (A.S. 32)  
    Award of Arms 09 Jan, 1993 (A.S. 27)

    Nocturnal Fellowship of Scribes: Founding member   
    Award of the Purple Fretty 17 Jan 1998 (A.S. 32)  
    Order of the Grove 11 May, 1996 (A.S. 31)")
    p215.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/213.png'), filename: '213.png', content_type: 'images/png');
    u216 = User.find_or_create_by(sca_name: "Alan of Caerlaverock") do |user|
       user.email = "banzhof@dnaco.net"
       user.password = "un7qxCfB"
       user.modern_name = "Bruce Banzhoff"
    end
    u216 = User.find_for_authentication(email: "banzhof@dnaco.net") unless u216.valid?
    p216 = Peer.create(user: u216, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2006-05-28"), active: true, vigilant: false, bio: "")
    p216.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/218.png'), filename: '218.png', content_type: 'images/png');
    u217 = User.find_or_create_by(sca_name: "Robert of Griffinholme") do |user|
       user.email = "baronrog@aol.com"
       user.password = "kZqkmUGn"
       user.modern_name = "Bob Krammes"
    end
    u217 = User.find_for_authentication(email: "baronrog@aol.com") unless u217.valid?
    p217 = Peer.create(user: u217, type: 'Pelican', elevated_by: "Alaric & Noelle", elevation_date: Date.parse("2005-09-10"), active: true, vigilant: false, bio: "")
    u218 = User.find_or_create_by(sca_name: "Raedwulf Caveron O'Dell") do |user|
       user.email = "sircaveron@verizon.net"
       user.password = "hSzbCXhz"
       user.modern_name = "Ralph O'Dell"
    end
    u218 = User.find_for_authentication(email: "sircaveron@verizon.net") unless u218.valid?
    p218 = Peer.create(user: u218, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2005-08-18"), active: true, vigilant: false, bio: "")
    u219 = User.find_or_create_by(sca_name: "Seadna O Bainainn") do |user|
       user.email = "baronessseadna@yahoo.com"
       user.password = "UBgzcNLi"
       user.modern_name = "Mary Winfield"
    end
    u219 = User.find_for_authentication(email: "baronessseadna@yahoo.com") unless u219.valid?
    unless u219.arms.attached?
      u219.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/216.gif'), filename: '216.gif', content_type: 'images/gif');
    end
    p219 = Peer.create(user: u219, type: 'Pelican', elevated_by: "Alaric & Noelle", elevation_date: Date.parse("2005-08-18"), active: true, vigilant: false, bio: "     Court Baron / Baroness 13 Apr, 2002 (A.S. 36) Order of the Dragon's Heart 22 Sep, 2001 (A.S. 36) Order of the Willow 27 Jan, 1996 (A.S. 30) Award of the Purple Fret 09 May, 1998 (A.S. 33) Award of the Doe's Grace 28 Sep, 2002 (A.S. 37) Award of Arms 17 Aug, 1990 (A.S. 25)")
    p219.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/216.png'), filename: '216.png', content_type: 'images/png');
    u220 = User.find_or_create_by(sca_name: "Aylwyn of Griffinholme") do |user|
       user.email = "aylwyn@aol.com"
       user.password = "7zTAAUWz"
       user.modern_name = "Mary Krammes"
    end
    u220 = User.find_for_authentication(email: "aylwyn@aol.com") unless u220.valid?
    p220 = Peer.create(user: u220, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2006-03-04"), active: true, vigilant: false, bio: "")
    p220.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/217.png'), filename: '217.png', content_type: 'images/png');
    u221 = User.find_or_create_by(sca_name: "Iasmin de Cordoba") do |user|
       user.email = "iasmindecordoba@mac.com"
       user.password = "oycPFdv7"
       user.modern_name = "Gaylin Walli"
    end
    u221 = User.find_for_authentication(email: "iasmindecordoba@mac.com") unless u221.valid?
    unless u221.arms.attached?
      u221.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/219.gif'), filename: '219.gif', content_type: 'images/gif');
    end
    p221 = Peer.create(user: u221, type: 'Pelican', elevated_by: "Edmund IV & Kateryn IV", elevation_date: Date.parse("2006-04-22"), active: true, vigilant: false, bio: "")
    p221.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/219.png'), filename: '219.png', content_type: 'images/png');
    u222 = User.find_or_create_by(sca_name: "Rocco Vittorio Barbarossa") do |user|
       user.email = "rocco@midrealm.org"
       user.password = "g5q68KC2"
       user.modern_name = "Rocco Sansotta"
    end
    u222 = User.find_for_authentication(email: "rocco@midrealm.org") unless u222.valid?
    unless u222.arms.attached?
      u222.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/220.gif'), filename: '220.gif', content_type: 'images/gif');
    end
    p222 = Peer.create(user: u222, type: 'Pelican', elevated_by: "Felix and Madeleina", elevation_date: Date.parse("2006-08-17"), active: true, vigilant: false, bio: "Norman soldier fighting in the Lombard Revolt against the Byzantines from 1017-1022.  Unable to return to Normandy, Rocco remained as a mercenary fighting alongside the Lombards in northern Calabria.  After figting in the Norman contingent in Sicily in 1038, returned to battle in Calabria, continuing to aid the Lombards against the Byzantines.  For his loyalty and bravery, Count William \"Iron Arm\" Hauteville assigned Rocco as Magister of the Castle Stridula in Squillace, Regio Calabria in 1045.")
    p222.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/220.png'), filename: '220.png', content_type: 'images/png');
    u223 = User.find_or_create_by(sca_name: "Ciara MacRobbie") do |user|
       user.email = "anne.akin@pfizer.com"
       user.password = "vrSpJNXo"
       user.modern_name = "Anne Akin"
    end
    u223 = User.find_for_authentication(email: "anne.akin@pfizer.com") unless u223.valid?
    p223 = Peer.create(user: u223, type: 'Pelican', elevated_by: "TRM Felix and Madeleina", elevation_date: Date.parse("2006-08-17"), active: true, vigilant: false, bio: "")
    p223.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/221.png'), filename: '221.png', content_type: 'images/png');
    u224 = User.find_or_create_by(sca_name: "Cathan MacCullaich") do |user|
       user.email = "pelican224@example.com"
       user.password = "xTSSMS1G"
       user.modern_name = "Matthew Dunbar"
    end
    u224 = User.find_for_authentication(email: "pelican224@example.com") unless u224.valid?
    unless u224.arms.attached?
      u224.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/222.gif'), filename: '222.gif', content_type: 'images/gif');
    end
    p224 = Peer.create(user: u224, type: 'Pelican', elevated_by: "Bardolph and Brigh<br>Vigiled by: Felix and Madeleina (17 Aug)", elevation_date: Date.parse("2006-10-21"), active: false, vigilant: false, bio: " ![](images/pelline.gif)

Greetings, Cousins.

As a fledgling member of this Order, I had the interesting experience of having someone who, upon hearing that I had been placed on vigil, ask was what it is, really, that I _do_, and why was I being offered the Accolade?

Beyond the first vaguely nonplussed thought that came to mind of 'well... um... for service?...', it struck me as a fair question, and one for which I didn't have a quick or simple answer. I've continued to mull that question over, and it seems it isn't a simple question at all, but has a number of parts.

What really is the nature of Service? Some people seem to think that to be recognized, that there must be some specific large act of service to which we can point. Others think instead of a body of service, with a list of results. What denotes one person's service as different from that of another? Good questions to ponder, even if they don't immediately have clear answers.

What really identifies a Peer? Within the context of the chivalric virtues, we at have a framework for discussion. For many discussions, really.

It also brings to mind that for many of us, service is not something we practice with the objective of being noticed, or to be the focus of atte ntion. It's something we do, whether quietly in plain sight or behind the scenes, in ways that are largely unnoticed or even invisible. For many things, that' s as it should be. But it should be a reminder to us that sometimes those serving well may serve unseen, and that we should always be watching for those who serve outside the limelight.

With all of that, there's still the simple, direct question. So for the curious, here's a brief Vitae...

 

 | Curriculum Vitae Societatus   
_...a few things I've found to do..._ |
| --- |
| **Pursuivant of Tirnewydd** | **Feb A.S. 22 to A.S. 26** |
| _Crown Tournament heraldry minion_ | _Swordcliffe, May A.S. 26_ |
| _Crown Tournament heraldry minion_ | _Jararvellir, Oct. A.S. 26_ |
| **Middle Marches Baronial Pursuivant** | **A.S. 26 to A.S. 30** |
| _Tournament Herald in Charge for Crown_ | _Nordskogen, 24 May A.S. 27_ |
| _Tournament Herald in Charge for Crown_ | _Stormvale, 17 Oct A.S. 27_ |
| **Chronicler of Tirnewydd** | **A.S. 27 to A.S. 29** |
| _Assistant Tournament Herald in Charge for Crown  
[Lady Meadows, Garlanda de Stanas]_ | _Fenix, 30 May 1993_ |
| _Tournament Herald in Charge for Crown  
[Lady Meadows, Garlanda de Stanas, being fought for, recused herself]_ | _Sternfeld, 23 Oct A.S. 28_ |
| _Tournament Herald in Charge for Crown_ | _Shattered Crystal, 29 May A.S. 29_ |
| **Meadows Herald [Lord Meadows]**  
(Deputy Kingdom Herald for Vocal Heraldry) | **Sep A.S. 29 to May A.S. 36** |
| _Tournament Herald in Charge for Crown_ | _Ben Dunfirth, 29 Oct A.S. 29_ |
| _Tournament Herald in Charge for Crown_ | _Shadowed Stars, 27 May A.S. 30_ |
| _Tournament Herald in Charge for Crown_ | _Swordcliffe, 21 Oct A.S. 30_ |
| _Tournament Herald in Charge for First Northshield Coronet_ | _Nordskogen, 6 Jan A.S. 31_ |
| _Tournament Herald in Charge for Crown_ | _Caer Anterth, 26 May A.S. 31_ |
| _Tournament Herald in Charge for Crown_ | _Flaming Gryphon, 12 Oct A.S. 31_ |
| _Tournament Herald in Charge for Crown_ | _Cynnabar, 25 May A.S. 32_ |
| _Tournament Herald in Charge for Crown_ | _Sternfeld, 1 Nov A.S. 32_ |
| _Tournament Herald in Charge for Crown_ | _Nordskogen, 24 May A.S. 33_ |
| _Tournament Herald in Charge for Crown_ | _Three Hills, 3 Oct A.S. 33_ |
| _Tournament Herald in Charge for Crown_ | _Rimsholt, 30 May A.S. 34_ |
| _Tournament Herald in Charge for Crown_ | _Sternfeld, 30 Oct A.S. 34_ |
| _Tournament Herald in Charge for Crown_ | _Dark River, 28 May A.S. 35_ |
| _Tournament Herald in Charge for Crown_ | _Fenix, 21 Oct A.S. 35_ |
| _Assistant Tournament Herald in Charge for Crown  
[Lord Meadows, Vorlin O'r Gwig]_ | _Border Downs, 27 May A.S. 36_ |
| **Herald at Large** | **May A.S. 36 to present** |
| **Middle Marches Baronial Chamberlain** | **May A.S. 40 to Oct A.S. 42** |
| **Chancellor of Pennsic University XXXV** | **Aug A.S. 40 to Aug A.S. 41** |
| **Deputy Mayor, Cultural Affairs, Pennsic XXXVI** | **Aug A.S. 41 to Aug A.S. 42** |
| **Rapier Marshal of Tirnewydd** | **A.S. 43 to A.S. 44** |
| 

 

 |
| **_...and a few way-points along the path..._** |
| Award of Arms | 10 Oct A.S. 26 |
| Award of the Purple Fret | 30 Jul A.S. 29 |
| Award of the Purple Fretty (as a Member of the Crown Tourney Crew) | 02 Nov A.S. 31 |
| Order of the Dragon's Heart | 10 Oct A.S. 33 |
| Sigil [of Æthelmaerc] (as a member of Staff of Pennsic XXXV) | 18 Aug A.S. 41 |
| Companion of the Order of the Pelican | 21 Oct A.S. 41 |
| Royal Augmentation of Arms  
(from TRM's Rurik and Angelik of Æthelmaerc) | 09 Aug A.S. 42 |")
    p224.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/222.png'), filename: '222.png', content_type: 'images/png');
    u225 = User.find_or_create_by(sca_name: "Johann Kinslayer") do |user|
       user.email = "johann_kinslayer@yahoo.com"
       user.password = "JE0sZEdi"
       user.modern_name = "John Cain"
    end
    u225 = User.find_for_authentication(email: "johann_kinslayer@yahoo.com") unless u225.valid?
    p225 = Peer.create(user: u225, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2006-08-17"), active: true, vigilant: false, bio: "")
    p225.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/223.png'), filename: '223.png', content_type: 'images/png');
    u226 = User.find_or_create_by(sca_name: "Caelan O Roghalleach") do |user|
       user.email = "baroncaelan@insightbb.com"
       user.password = "Pc1LHcLF"
       user.modern_name = "John Riley"
    end
    u226 = User.find_for_authentication(email: "baroncaelan@insightbb.com") unless u226.valid?
    unless u226.arms.attached?
      u226.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/224.gif'), filename: '224.gif', content_type: 'images/gif');
    end
    p226 = Peer.create(user: u226, type: 'Pelican', elevated_by: "Felix II and Madeleina II", elevation_date: Date.parse("2006-08-17"), active: true, vigilant: false, bio: "If you're looking for more information, try:

[http://baroncaelan.home.insightbb.com](http://baroncaelan.home.insightbb.com)")
    u227 = User.find_or_create_by(sca_name: "Gyda Arnarsdottir") do |user|
       user.email = "baroness_cat@hotmail.com"
       user.password = "Km5SIuCo"
       user.modern_name = "Anne Berdanier"
    end
    u227 = User.find_for_authentication(email: "baroness_cat@hotmail.com") unless u227.valid?
    unless u227.arms.attached?
      u227.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/225.gif'), filename: '225.gif', content_type: 'images/gif');
    end
    p227 = Peer.create(user: u227, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "Gy a Arn rsd ttir / Cathryn of Chester")
    p227.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/225.png'), filename: '225.png', content_type: 'images/png');
    u229 = User.find_or_create_by(sca_name: "Rhiannon Siobhan Shynane") do |user|
       user.email = "charlakinzel@gmail.com"
       user.password = "NEPpbC0u"
       user.modern_name = "Charla Kinzel"
    end
    u229 = User.find_for_authentication(email: "charlakinzel@gmail.com") unless u229.valid?
    unless u229.arms.attached?
      u229.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/227.gif'), filename: '227.gif', content_type: 'images/gif');
    end
    p229 = Peer.create(user: u229, type: 'Pelican', elevated_by: "Bardolph & Brigh", elevation_date: Date.parse("2007-03-15"), active: true, vigilant: false, bio: "")
    p229.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/227.png'), filename: '227.png', content_type: 'images/png');
    u231 = User.find_or_create_by(sca_name: "Sabine de Rouen") do |user|
       user.email = "Sabine@ParagonKeep.org"
       user.password = "d4NxinAr"
       user.modern_name = "Chele Martines"
    end
    u231 = User.find_for_authentication(email: "Sabine@ParagonKeep.org") unless u231.valid?
    unless u231.arms.attached?
      u231.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/243.gif'), filename: '243.gif', content_type: 'images/gif');
    end
    p231 = Peer.create(user: u231, type: 'Pelican', elevated_by: "Dag V & AnneMarie I", elevation_date: Date.parse("2007-09-08"), active: false, vigilant: false, bio: "_ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  _

_My Proteges_

_Mistress Anne Marie Morgaine (Elevated 10 Sep, 2011)_

_Sargeant Margat Catte called Magrat   _

_I dabble in illumination, period cooking, bead making, fiber arts such as weaving and dying, apparel patterning, and more.  I am always willing to share my knowledge so please feel free to contact me for assistance._

_Duchesse [Sabine de Rouen](http://consorts.midrealm.org/peer_new.php?input=94), matriarch of Vinterholt, lives in 13th century Normandy with her husband [Syr Kyppyn Kirkcaldy](http://chivalry.midrealm.org/peer_new.php?input=225), [OP](../peer_new.php?input=255) and their two daughters, Astrid and Thyri. Sabine is a founding member of the Paragon Keep Alliance._

_Chele Martines is a mom with lots of degrees and titles but none more important than \"Mommy\" and \"Wife\".  When she is not working as a designer and patternmaker for apparel and accessories she spends all of her time with her wonderful husband Kipp and her two beautiful daughters Amelia and Tabitha._

_Duchess (Meridies) 09 Sep, 2000 (A.S. 35) _

_Countess (Meridies)10 Apr, 1999 (A.S. 33) _

_Order of the Pelican (Midrealm) 08 Sep, 2007 (A.S. 42) _

_Court Baroness (Midrealm) 02 Apr, 2011 (A.S. 45) _

_Order of the Dragon's Heart (Midrealm) 28 May, 2006 (A.S. 41) _

_Order of the Evergreen (Midrealm) 27 May, 2007 (A.S. 42) _

_Grant of Arms Dragon Crest (Midrealm)19 Apr, 2008 (A.S. 42) _

_Order of the Willow (Midrealm) 04 Dec, 2010 (A.S. 45) _

_Award of the Purple Fret (Midrealm) 10 Sep, 2005 (A.S. 40) _

_Award of Arms (Meridies) 02 Nov, 1996 (A.S. 31) _

_Order of the Argent Lily (Meridies) 28 Aug, 1999 (A.S. 34) _

_Velvet Owl (Meridies) 28 Aug, 1999 (A.S. 34) _

_Order of the Rose (Meridies) 10 Apr, 1999 (A.S. 33) _

_Royal Augmentation of Arms An annulet Or (Midrealm) 29 Sep, 2007 (A.S. 42)  _

_ Landed Baroness Flaming Gryphon (Midrealm) 04 Apr, 2009 (A.S. 43) _

_Award of the Flaming Brand (Flaming Gryphon) 05 Mar, 2005 (A.S. 39) _

_Award of the Gryphon's Plume (Flaming Gryphon) 08 Jul, 2006 (A.S. 41)   _")
    p231.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/243.png'), filename: '243.png', content_type: 'images/png');
    u232 = User.find_or_create_by(sca_name: "Roewynne Langley") do |user|
       user.email = "terri.shurgin@gmail.com"
       user.password = "Y7gGNavn"
       user.modern_name = "Terri Joyce Shurgin"
    end
    u232 = User.find_for_authentication(email: "terri.shurgin@gmail.com") unless u232.valid?
    p232 = Peer.create(user: u232, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2007-08-09"), active: true, vigilant: false, bio: "I've been an Archer and Scribe in both Calligraphy and Illumination since 1981. I married Vorlin o'r Gwig (Gary Shurgin) in 1987, and have 3 daughters: Rebecca (at Northern Ill. U., in DeKalb) majoring in Physics, Math & Chemistry; Rachel a Jr. in HS, taking Culinary Arts at Vocational school, and Jessica, a H,S. Freshman who loves Band, and plays the Clarinet.  They all participate in the SCA.  I am the Librarian at Crooksville High School.

I live in the boonies in the middle of the Barony of the Middle Marches. I am a member of the Shire of Mugmort. I have been an Archery Marshal since 1982, and am currently the Pennsic Youth Archery Commander.")
    u233 = User.find_or_create_by(sca_name: "Morgan De'Ath") do |user|
       user.email = "morgandeath@gmail.com"
       user.password = "dLTBjGOB"
       user.modern_name = "Bret Johnson"
    end
    u233 = User.find_for_authentication(email: "morgandeath@gmail.com") unless u233.valid?
    unless u233.arms.attached?
      u233.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/247.gif'), filename: '247.gif', content_type: 'images/gif');
    end
    p233 = Peer.create(user: u233, type: 'Pelican', elevated_by: "Palymar & Aislinn", elevation_date: Date.parse("2008-04-12"), active: true, vigilant: false, bio: "")
    p233.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/247.png'), filename: '247.png', content_type: 'images/png');
    u234 = User.find_or_create_by(sca_name: "Acelina of Derelai") do |user|
       user.email = "djc137@aol.com"
       user.password = "jt9QbpuU"
       user.modern_name = "Dayle Harding"
    end
    u234 = User.find_for_authentication(email: "djc137@aol.com") unless u234.valid?
    unless u234.arms.attached?
      u234.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/252.gif'), filename: '252.gif', content_type: 'images/gif');
    end
    p234 = Peer.create(user: u234, type: 'Pelican', elevated_by: "TRM Tessa & Lutr", elevation_date: Date.parse("2008-08-07"), active: true, vigilant: false, bio: "")
    p234.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/252.png'), filename: '252.png', content_type: 'images/png');
    u235 = User.find_or_create_by(sca_name: "Margarete of Stirlingshire") do |user|
       user.email = "pelican235@example.com"
       user.deceased = true,
       user.password = "qd30FApE"
       user.modern_name = "Mary Higgins"
    end
    u235 = User.find_for_authentication(email: "pelican235@example.com") unless u235.valid?
    unless u235.arms.attached?
      u235.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/245.gif'), filename: '245.gif', content_type: 'images/gif');
    end
    p235 = Peer.create(user: u235, type: 'Pelican', elevated_by: "Andreas and Isabella (East)", elevation_date: Date.parse("2001-01-13"), active: false, vigilant: false, bio: "")
    u236 = User.find_or_create_by(sca_name: "Donnan the Truehearted") do |user|
       user.email = "sirdonnan@gmail.com"
       user.password = "4rhjEdj8"
       user.modern_name = "Jeff Brown"
    end
    u236 = User.find_for_authentication(email: "sirdonnan@gmail.com") unless u236.valid?
    p236 = Peer.create(user: u236, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u237 = User.find_or_create_by(sca_name: "Straum von Bairzog") do |user|
       user.email = "Straum@comcast.net"
       user.password = "UccXcPk5"
       user.modern_name = "David Ross"
    end
    u237 = User.find_for_authentication(email: "Straum@comcast.net") unless u237.valid?
    p237 = Peer.create(user: u237, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u238 = User.find_or_create_by(sca_name: "William Campion") do |user|
       user.email = "keithlarson1470@gmail.com"
       user.password = "vhjcOg28"
       user.modern_name = "Keith Larson"
    end
    u238 = User.find_for_authentication(email: "keithlarson1470@gmail.com") unless u238.valid?
    p238 = Peer.create(user: u238, type: 'Pelican', elevated_by: "Lutr and Tessa", elevation_date: Date.parse("2008-08-06"), active: true, vigilant: false, bio: "")
    p238.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/253.png'), filename: '253.png', content_type: 'images/png');
    u239 = User.find_or_create_by(sca_name: "Moira MacGillavrey") do |user|
       user.email = "macgillavrey@gmail.com"
       user.password = "0sa9Z5gO"
       user.modern_name = "Polly Redmond"
    end
    u239 = User.find_for_authentication(email: "macgillavrey@gmail.com") unless u239.valid?
    unless u239.arms.attached?
      u239.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/254.gif'), filename: '254.gif', content_type: 'images/gif');
    end
    p239 = Peer.create(user: u239, type: 'Pelican', elevated_by: "Ullr and AnneLyse", elevation_date: Date.parse("2008-09-27"), active: true, vigilant: false, bio: "")
    p239.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/254.png'), filename: '254.png', content_type: 'images/png');
    u240 = User.find_or_create_by(sca_name: "Mary Buchanan") do |user|
       user.email = "pelican240@example.com"
       user.password = "mfveoOFA"
       user.modern_name = ""
    end
    u240 = User.find_for_authentication(email: "pelican240@example.com") unless u240.valid?
    unless u240.arms.attached?
      u240.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/257.gif'), filename: '257.gif', content_type: 'images/gif');
    end
    p240 = Peer.create(user: u240, type: 'Pelican', elevated_by: "Ullr and Annelyse", elevation_date: Date.parse("2009-01-31"), active: true, vigilant: false, bio: "")
    p240.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/257.png'), filename: '257.png', content_type: 'images/png');
    u241 = User.find_or_create_by(sca_name: "Arabella Silvermane") do |user|
       user.email = "arablla@hotmail.com"
       user.password = "UhegxtVL"
       user.modern_name = "Lisa Gray"
    end
    u241 = User.find_for_authentication(email: "arablla@hotmail.com") unless u241.valid?
    unless u241.arms.attached?
      u241.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/258.gif'), filename: '258.gif', content_type: 'images/gif');
    end
    p241 = Peer.create(user: u241, type: 'Pelican', elevated_by: "Ullr and AnneLyse", elevation_date: Date.parse("2014-02-14"), active: true, vigilant: false, bio: "")
    p241.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/258.png'), filename: '258.png', content_type: 'images/png');
    u242 = User.find_or_create_by(sca_name: "Torquil MacGillavrey") do |user|
       user.email = "torquilmacgil@gmail.com"
       user.password = "bpx1moTd"
       user.modern_name = "Tom Redmond"
    end
    u242 = User.find_for_authentication(email: "torquilmacgil@gmail.com") unless u242.valid?
    unless u242.arms.attached?
      u242.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/259.gif'), filename: '259.gif', content_type: 'images/gif');
    end
    p242 = Peer.create(user: u242, type: 'Pelican', elevated_by: "Ullr I and AnneLyse I", elevation_date: Date.parse("2009-04-09"), active: true, vigilant: false, bio: "Proteges: THL Kara Cypriani Lady Valaria Contadina Lord Ronan Keith")
    p242.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/259.png'), filename: '259.png', content_type: 'images/png');
    u243 = User.find_or_create_by(sca_name: "Dag Thorgrimsson") do |user|
       user.email = "pelican243@example.com"
       user.password = "fgtRuxfF"
       user.modern_name = ""
    end
    u243 = User.find_for_authentication(email: "pelican243@example.com") unless u243.valid?
    p243 = Peer.create(user: u243, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    p243.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/260.png'), filename: '260.png', content_type: 'images/png');
    u244 = User.find_or_create_by(sca_name: "Milica of Varna") do |user|
       user.email = "milica@4th.com"
       user.password = "QukUnCPz"
       user.modern_name = "Katherine Courtney"
    end
    u244 = User.find_for_authentication(email: "milica@4th.com") unless u244.valid?
    p244 = Peer.create(user: u244, type: 'Pelican', elevated_by: "EikBrandr & Runa", elevation_date: Date.parse("2009-06-13"), active: true, vigilant: false, bio: "")
    u245 = User.find_or_create_by(sca_name: "Callista Balgaire") do |user|
       user.email = "deborha.brown2@hotmail.com"
       user.password = "PtNMSUA0"
       user.modern_name = "Deborah Brown"
    end
    u245 = User.find_for_authentication(email: "deborha.brown2@hotmail.com") unless u245.valid?
    p245 = Peer.create(user: u245, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u246 = User.find_or_create_by(sca_name: "Jean Paul Pierrepont") do |user|
       user.email = "pvandyke1953@gmail.com"
       user.password = "Wfhavz90"
       user.modern_name = "Paul W. Van Dyke"
    end
    u246 = User.find_for_authentication(email: "pvandyke1953@gmail.com") unless u246.valid?
    unless u246.arms.attached?
      u246.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/264.gif'), filename: '264.gif', content_type: 'images/gif');
    end
    p246 = Peer.create(user: u246, type: 'Pelican', elevated_by: " Eikbrandr Solgyafi      &        Runa Eikbrandrswif", elevation_date: Date.parse("2009-08-06"), active: true, vigilant: false, bio: "**[Order of the Pelican](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=6)-----------------------**  **06 Aug, 2009** **(A.S. 44)**

**[Order of the Laurel](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=6) ------------------------- [17 Aug, 2000](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=2000&mon=08&day=17) (A.S. 35)**

**[Court Baron / Baroness](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=12) ------------------- [19 Apr, 2008](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=2008&mon=04&day=19) (A.S. 42)**

**[Order of the Dragon\'s Heart](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=13) ------------ [05 Jan, 2008](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=2008&mon=01&day=05) (A.S. 42)**

**[Order of the Greenwood Company](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=17) - [31 Jan, 1998](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=1998&mon=01&day=31) (A.S. 32)**

**[Order of the Silver Oak](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=14) ------------------- [26 Feb, 2000](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=2000&mon=02&day=26) (A.S. 34)**

**[Award of the Purple Fret](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=19) ---------------- [09 Aug, 2007](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=2007&mon=08&day=09) (A.S. 42)**

**[Order of the Dragon\'s Barb](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=24) -------------- [25 May, 1997](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=1997&mon=05&day=25) (A.S. 32)**

**[Award of Arms](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=27) --------------------------------- [08 July, 1995](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=1995&mon=07&day=08) (A.S. 30)**

**[Award of the Sapphire](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=49) -------------------- [13 Sep, 2003](http://www.midrealm.org/op/op.php?searchvar=bydate&yer=2003&mon=09&day=13) (A.S. 38)**")
    p246.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/264.png'), filename: '264.png', content_type: 'images/png');
    u247 = User.find_or_create_by(sca_name: "Konrad Mailander") do |user|
       user.email = "konrad@midrealm.org"
       user.password = "5mdXw8Hp"
       user.modern_name = "Dale Niederhauser"
    end
    u247 = User.find_for_authentication(email: "konrad@midrealm.org") unless u247.valid?
    unless u247.arms.attached?
      u247.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/265.gif'), filename: '265.gif', content_type: 'images/gif');
    end
    p247 = Peer.create(user: u247, type: 'Pelican', elevated_by: "Eikbrandr & Runa", elevation_date: Date.parse("2009-09-05"), active: true, vigilant: false, bio: "I know I like to see something on these pages about the person so here is my SCA Curriculum Vitae:

I joined the SCA April 1993.  Since that time I have been an active member of the Marche of the Marshes and the Canton of Hr  geirsfj r r in the Barony of Red Spears.  I have been interested in period games, especially card games since shortly after I started in the SCA, a herald since 1994, an authorized fighter since 1995 and an authorized fencer since 2004.  My perosna is a 16th century Reisl ufer Hauptmann (Swiss Mercenary Captain).

I have served the Barony through the following offices:   
   March of the Marshes Herald Oct. 1994 - Feb. 1995  
   Red Spears Herald Feb. 1995-2000   
   Red Spears Web Minister 1999 - 2009  
   Hr  geirsfj r r Web Minister 1999 - 200?               
   Red Spears Knights Marshal 2000 - 2004  
   Red Spears Exchequer 2006-2011  
   Red Spears Seneschal 2011-2016

Other offices held:  
   Baronial Chivalric Champion - April 1994 - June 1995   
   Baronial Archery Champion - June 1996 - July 1997 & July 1998 - July 2000  
   Baronial Armored Combat Champion - December 1997 - June 1998  
                                                           September 2009 - September 2010  
                                                           September 2012 - October 2013  
   Red Spears XO 1998   
   Red Spears Commander 1999   
   Chronicler at Large - Publishing The Warhogs newsletter for Baronial Fighters 1999-2001  
   Middle Kingdom Unbelted Champions Team 2001-2012  
   North Oaken Regional XO 2002,  2003  
   Oaken Regional Herald 2001 - 2004, 2005  
   North Oaken Regional Marshal 2007-2009  
   Herald at Large 2004-2005, 2005-2010  
   Rouge Scarpe Herald (External Submissions) 2010-2016, 2017-2018  
   Dragon Herald May 2016- Sept 2017  
   Armored Combat Marshal of the Field 2004-2007, 2009-present  
   Rapier Marshal of the Field 2014-present

First Recipient of the Langar Thurs - The Oaken Spear 1999

Apprentice to Master Brusten de Bearsul, OL(gaming), OP since 1995  
Squire to Baron Gunther von Brandenburg KSCA since 2003

Midrealm Awards:   
    Order of the Pelican - 9/5/09  
    Order of the Dragon\'s Heart - 2/9/08  
    Order of the Gold Mace - 3/1/03   
    Order of the Silver Oak - 6/6/98  
    Order of the Red Company - 6/3/00   
    Order of the Dragon\'s Tooth 8/14/02, 8/15/02  
    Award of the Doe\'s Grace - 4/17/04   
    Award of the Purple Fret - 8/14/96   
    Order of the Cavendish Knot - 3/14/08   
    Award of Arms - 2/19/94   
    Award of the Sapphire - 8/1/13  
    Herald Extraordinary - 10/18/14

Red Spears Awards:    
    Order of the Hastati - Baronial Spirit Award - 10/6/95 Co-premier of Order   
    Barons Honour Guard - Highest Baronial Fighting Award - 8/16/97   
    Orde van de Zuil - Service Award - 7/1/95   
    Order of the Ruby Chalice - Arts & Sciences Award - 2/18/95   
    Order of the Boars Eye - Archery Award - 2/18/95   
    Order of the Hildisvin - Fighting Award - 10/6/95  
    Order of l\'Epee Rouge - Rapier Award - 7/20/08  
    Commander of the Boarsbane - Combat, Service and A&S - 12/8/07  
    Order of the Boarsbane - Service Award - 12/5/98   
    Sheriff of Red Spears - 8/16/03  
    Order of the Boarsheart - 8/11/10

I have five prot g s Lady Isib l of Dunbegane, Lady Sorcha Ruadh inghean Lochlainn, Baron Raffaele da Cernia, Baroness Margherita di Raffaele, and Lady Avigayl bat Avraham.")
    p247.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/265.png'), filename: '265.png', content_type: 'images/png');
    u248 = User.find_or_create_by(sca_name: "Gwyneth Banfhidhleir") do |user|
       user.email = "mizginny@yahoo.com"
       user.password = "iOQ2CusV"
       user.modern_name = "Ginny Beatty"
    end
    u248 = User.find_for_authentication(email: "mizginny@yahoo.com") unless u248.valid?
    unless u248.arms.attached?
      u248.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/266.gif'), filename: '266.gif', content_type: 'images/gif');
    end
    p248 = Peer.create(user: u248, type: 'Pelican', elevated_by: "EikBrandr and Runa", elevation_date: Date.parse("2009-09-05"), active: true, vigilant: false, bio: "Motto: Fides, Pertinacia, et Ignis (Faith, determination, and fire)

Specialties: Culinary arts and logistics, event planning, volunteer coordination and training.

Protegees:

- Lady Ximena Ramirez, Barony of Nordskogen, Northshield
- Lady Nasira bint al-Fuqma al-Baida (Nyah McPhee), Shire of Mugmort, Midrealm

Member of the Angry Birds pelican rapier unit of PW 46 - recipients of the Award of the Dragon\'s Teeth for valor during the rapier field battle.")
    p248.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/266.png'), filename: '266.png', content_type: 'images/png');
    u249 = User.find_or_create_by(sca_name: "Uadahlrich von Sassmannshausen") do |user|
       user.email = "timnie4401@gmail.com"
       user.password = "AdF8eWOU"
       user.modern_name = "Tim Nie"
    end
    u249 = User.find_for_authentication(email: "timnie4401@gmail.com") unless u249.valid?
    unless u249.arms.attached?
      u249.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/271.gif'), filename: '271.gif', content_type: 'images/gif');
    end
    p249 = Peer.create(user: u249, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    p249.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/271.png'), filename: '271.png', content_type: 'images/png');
    u250 = User.find_or_create_by(sca_name: "Llewellyn ap Teirnon") do |user|
       user.email = "llewhobbs@gmail.com"
       user.password = "jkNrwobo"
       user.modern_name = "Micheal Hobbs"
    end
    u250 = User.find_for_authentication(email: "llewhobbs@gmail.com") unless u250.valid?
    p250 = Peer.create(user: u250, type: 'Pelican', elevated_by: "Savaric and Juliana", elevation_date: Date.parse("2012-09-09"), active: true, vigilant: false, bio: "")
    p250.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/286.png'), filename: '286.png', content_type: 'images/png');
    u251 = User.find_or_create_by(sca_name: "Caitlin Stuart") do |user|
       user.email = "1director@rogers.com"
       user.password = "ZOJiLENz"
       user.modern_name = "Nancy Frankel"
    end
    u251 = User.find_for_authentication(email: "1director@rogers.com") unless u251.valid?
    unless u251.arms.attached?
      u251.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/284.gif'), filename: '284.gif', content_type: 'images/gif');
    end
    p251 = Peer.create(user: u251, type: 'Pelican', elevated_by: "Arch & Runa", elevation_date: Date.parse("2011-08-10"), active: true, vigilant: false, bio: "| **HONOR** | **DATE** | **BESTOWED BY** |
| [Award of Arms](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=27) | 01.14.1978 | Middle |
| [Order of the Willow](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=15) | 01.13.1979 | Middle |
| [Award of the Purple Fret](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=19) | 10.15.1980 | Middle |
| [Countess](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=2) | 10.03.1981 | Middle |
| _Order of the Torse_ | _11.14.1981_ | _Calontir_ |
| [Order of the Laurel](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=6) | 05.30.1982 | Middle |
| [Order of the Rose (resigned)](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=9) | 04.04.1992 | Middle |
| [Award of the Doe's Grace](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=20) | 05.14.1994 | Middle |
| _Order of the Golden Otter_ | _03.25.1995_ | _Middle for Principality of Ealdormere_ [_(closed_](http://wolfium.com/search.php?idaward=CPH) _honor)_ |
| _Order of the Bee_ | _04.20.1996_ | _Middle for Principality of Ealdormere_ [_(closed_](http://wolfium.com/search.php?idaward=CPH) _honor)_ |
| [Order of the Dragon's Heart](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=13) | 04.20.1996 | Middle |
| [Duchess](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=1) | 03.01.1997 | Middle |
| [Order of the Rose](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=9) | 03.01.1997 | Middle |
| [_Award of the Guidon de Sang_](http://wolfium.com/search.php?idaward=AG) | _04.10.1997_ | _Ealdormere - Barony of Ramshaven_ |
| _Friendship of the Trillium_ | _10.17.1998_ | _Middle for Principality of Ealdormere_ [_(closed_](http://wolfium.com/search.php?idaward=CPH) _honor)_ |
| [Grant of Arms](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=10) | 08.19.1999 | Middle |
| [Award of the Doe's Grace](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=20) | 04.29.2000 | Middle |
| [_Award of the Queen's Favor_](http://wolfium.com/search.php?idaward=AQF) | _04.29.2000_ | _Ealdormere_ |
| [Kingdom Augmentation of Arms](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=36) | 06.01.2002 | Middle |
| [_Royal Augmentation of Arms_](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=45) | _10.05.2002_ | _Middle for Principality of Northshield_ |
| _King's Award of Excellence_ | _08.09.2007_ | _Aethelmearc_ |
| [Court Baroness](http://www.midrealm.org/op/op.php?searchvar=byhonor&input2=12) | 02.16.2008 | Middle |
| Order of the Pelican | 08.10.2011 | Middle |")
    p251.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/284.png'), filename: '284.png', content_type: 'images/png');
    u252 = User.find_or_create_by(sca_name: "Etienne le Couteau des Roches") do |user|
       user.email = "spdesroches56@gmail.com"
       user.password = "7n9ptB9b"
       user.modern_name = "Steven P DesRoches"
    end
    u252 = User.find_for_authentication(email: "spdesroches56@gmail.com") unless u252.valid?
    p252 = Peer.create(user: u252, type: 'Pelican', elevated_by: "Ullr and AnneLyse", elevation_date: Date.parse("2011-01-16"), active: true, vigilant: false, bio: "")
    p252.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/274.png'), filename: '274.png', content_type: 'images/png');
    u253 = User.find_or_create_by(sca_name: "Philip White") do |user|
       user.email = "philipwhite@hotmail.com"
       user.password = "8W4gXbPh"
       user.modern_name = "Craig Shupee'"
    end
    u253 = User.find_for_authentication(email: "philipwhite@hotmail.com") unless u253.valid?
    unless u253.arms.attached?
      u253.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/275.gif'), filename: '275.gif', content_type: 'images/gif');
    end
    p253 = Peer.create(user: u253, type: 'Pelican', elevated_by: "Ullr Amaranthson II and AnneLyse Van Gavere II", elevation_date: Date.parse("2011-02-12"), active: true, vigilant: false, bio: "")
    p253.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/275.png'), filename: '275.png', content_type: 'images/png');
    u254 = User.find_or_create_by(sca_name: "Neko Me") do |user|
       user.email = "zzdragon@comcast.net"
       user.deceased = true,
       user.password = "ljF99LyR"
       user.modern_name = "Keith Drew"
    end
    u254 = User.find_for_authentication(email: "zzdragon@comcast.net") unless u254.valid?
    p254 = Peer.create(user: u254, type: 'Pelican', elevated_by: "",  active: false, vigilant: false, bio: "")
    u255 = User.find_or_create_by(sca_name: "Anna of the Western Hill") do |user|
       user.email = "AnnaWHill@aol.com"
       user.password = "g2ShAEee"
       user.modern_name = "Monti Greenawalt"
    end
    u255 = User.find_for_authentication(email: "AnnaWHill@aol.com") unless u255.valid?
    p255 = Peer.create(user: u255, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    p255.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/273.png'), filename: '273.png', content_type: 'images/png');
    u256 = User.find_or_create_by(sca_name: "Ailikn Olafsdottir") do |user|
       user.email = "yasin7575@gmail.com"
       user.password = "rMLluAyh"
       user.modern_name = ""
    end
    u256 = User.find_for_authentication(email: "yasin7575@gmail.com") unless u256.valid?
    p256 = Peer.create(user: u256, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2011-06-18"), active: true, vigilant: false, bio: "")
    u257 = User.find_or_create_by(sca_name: "Randolph Lee") do |user|
       user.email = "rlbaker@me.com"
       user.password = "JaZgmnDq"
       user.modern_name = "Randy Baker"
    end
    u257 = User.find_for_authentication(email: "rlbaker@me.com") unless u257.valid?
    unless u257.arms.attached?
      u257.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/278.gif'), filename: '278.gif', content_type: 'images/gif');
    end
    p257 = Peer.create(user: u257, type: 'Pelican', elevated_by: "TRM Arch & Runa", elevation_date: Date.parse("2011-05-29"), active: true, vigilant: false, bio: "Order of the Chivalry;   
Baron of the Court;  
Order of the Dragons Heart;   
Grant of Arms;   
Order of the Red Company;   
Award of Arms;   
Baron Fenix (Retired);   
Earl Marshal(Retired);")
    p257.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/278.png'), filename: '278.png', content_type: 'images/png');
    u258 = User.find_or_create_by(sca_name: "Helewyse de Birkstad") do |user|
       user.email = "pelican258@example.com"
       user.password = "87690lyd"
       user.modern_name = "Louise Smithson"
    end
    u258 = User.find_for_authentication(email: "pelican258@example.com") unless u258.valid?
    unless u258.arms.attached?
      u258.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/279.gif'), filename: '279.gif', content_type: 'images/gif');
    end
    p258 = Peer.create(user: u258, type: 'Pelican', elevated_by: "Arch and Runa", elevation_date: Date.parse("2011-06-26"), active: true, vigilant: false, bio: " **Home group:** Canton of Grey Gargoyle in Ayreton, Although the home of my heart will always be Red Spears where I served as Baroness for 5 years. 

**Personal:** I play with both pottery and food spending much of my time translating recipes from Italian to English.  My other interests include brewing meads and ales. Most of my research is now available through medieval cookery.  http://www.medievalcookery.com/helewyse

**Current projects:** Serving as a local seneschal in Grey Gargoyles in Ayreton")
    p258.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/279.png'), filename: '279.png', content_type: 'images/png');
    u259 = User.find_or_create_by(sca_name: "Robyyan Torr d'Elandris") do |user|
       user.email = "rtesca-robyyan@yahoo.com"
       user.password = "FROVL5TM"
       user.modern_name = "Dennis Sherman"
    end
    u259 = User.find_for_authentication(email: "rtesca-robyyan@yahoo.com") unless u259.valid?
    unless u259.arms.attached?
      u259.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/280.gif'), filename: '280.gif', content_type: 'images/gif');
    end
    p259 = Peer.create(user: u259, type: 'Pelican', elevated_by: "Arch and Runa", elevation_date: Date.parse("2011-08-11"), active: true, vigilant: false, bio: "Contact me at [http://www.dennissherman.com/robyyan/contact](http://www.dennissherman.com/robyyan/contact \"Send\")")
    p259.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/280.png'), filename: '280.png', content_type: 'images/png');
    u260 = User.find_or_create_by(sca_name: "Sarafina Sinclair") do |user|
       user.email = "sarafina.sinclair@gmail.com"
       user.password = "BGBgz55b"
       user.modern_name = ""
    end
    u260 = User.find_for_authentication(email: "sarafina.sinclair@gmail.com") unless u260.valid?
    unless u260.arms.attached?
      u260.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/281.gif'), filename: '281.gif', content_type: 'images/gif');
    end
    p260 = Peer.create(user: u260, type: 'Pelican', elevated_by: "Arch and Runa", elevation_date: Date.parse("2011-07-16"), active: true, vigilant: false, bio: "")
    p260.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/281.png'), filename: '281.png', content_type: 'images/png');
    u261 = User.find_or_create_by(sca_name: "Anne Marie Morgaine") do |user|
       user.email = "theladymorgaine@gmail.com"
       user.password = "LAeNKY65"
       user.modern_name = "Ann-Marie Small"
    end
    u261 = User.find_for_authentication(email: "theladymorgaine@gmail.com") unless u261.valid?
    unless u261.arms.attached?
      u261.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/282.gif'), filename: '282.gif', content_type: 'images/gif');
    end
    p261 = Peer.create(user: u261, type: 'Pelican', elevated_by: "TE Arch Teryx & Runa", elevation_date: Date.parse("2011-09-10"), active: true, vigilant: false, bio: "Motto: To serve where serve I might\"")
    p261.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/282.png'), filename: '282.png', content_type: 'images/png');
    u262 = User.find_or_create_by(sca_name: "Maddalena Della Tavalozza") do |user|
       user.email = "madseamstress@comcast.net"
       user.password = "2nLQzFtn"
       user.modern_name = "Patricia Riley"
    end
    u262 = User.find_for_authentication(email: "madseamstress@comcast.net") unless u262.valid?
    p262 = Peer.create(user: u262, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u263 = User.find_or_create_by(sca_name: "Isgerdr Gulkarr") do |user|
       user.email = "practicalviking@gmail.com"
       user.password = "rWUXQm54"
       user.modern_name = "Kymberli Wanat"
    end
    u263 = User.find_for_authentication(email: "practicalviking@gmail.com") unless u263.valid?
    p263 = Peer.create(user: u263, type: 'Pelican', elevated_by: "Stephen and Ailleanne", elevation_date: Date.parse("2009-08-06"), active: true, vigilant: false, bio: "**Hver munu gild um gjörvast,  
 gulls vel borin selja,  
 verk, þau er einn fær orkað,  
 ítr, ef slík eru lítil.**

**O fair giver forth of gold,  
 Whereof can great words be told,  
 'Midst the deeds one man has wrought,  
 If this deed should come to nought?\"**

###                                    ~ [Grettir's _Saga_](http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CCwQFjAB&url=http%3A%2F%2Fsagadb.org%2Fgrettis_saga.en&ei=6oopVJS7MdalyASHiYGwBw&usg=AFQjCNGc8e1KksFtZKTMlFl7K3c6pNn1Sg&sig2=A2wqZKRu7YUMnrf6LuDIBg&bvm=bv.76247554,d.aWw)")
    p263.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/285.png'), filename: '285.png', content_type: 'images/png');
    u264 = User.find_or_create_by(sca_name: "Petrona da Manciano") do |user|
       user.email = "petronadamanciano@gmail.com"
       user.password = "vyvl8SP5"
       user.modern_name = "Christina Rivelli"
    end
    u264 = User.find_for_authentication(email: "petronadamanciano@gmail.com") unless u264.valid?
    unless u264.arms.attached?
      u264.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/330.gif'), filename: '330.gif', content_type: 'images/gif');
    end
    p264 = Peer.create(user: u264, type: 'Pelican', elevated_by: "Cameron & Amalie II", elevation_date: Date.parse("2016-08-27"), active: true, vigilant: false, bio: "Greetings,  I have chosen the title Magistra rather than Mistress for several reasons. The Latin is more appropriate to an Italian Lady, also the meaning is significant to me. The translation is revered or honored teacher. I believe a Peer should strive to teach, that this is one of the best ways to enrich our Society. In my elevation I promised to,  encourage all who come to me seeking knowledge and assistance. Magistra reminds me of that pledge. In light of that, please do not hesitate to seek me out if I may be of help to you. It will be my honor.")
    p264.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/330.png'), filename: '330.png', content_type: 'images/png');
    u265 = User.find_or_create_by(sca_name: "Bianca Rosamund") do |user|
       user.email = "mbianca@earthlink.net"
       user.password = "PtcbOGNp"
       user.modern_name = "Marline Broderick"
    end
    u265 = User.find_for_authentication(email: "mbianca@earthlink.net") unless u265.valid?
    p265 = Peer.create(user: u265, type: 'Pelican', elevated_by: "Cameron & Amalie II", elevation_date: Date.parse("2016-06-25"), active: true, vigilant: false, bio: "")
    p265.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/331.png'), filename: '331.png', content_type: 'images/png');
    u266 = User.find_or_create_by(sca_name: "Catarina deBruyn") do |user|
       user.email = "chris.wittenbach@att.net"
       user.password = "N4HN8KXs"
       user.modern_name = "Christine Wittenbach"
    end
    u266 = User.find_for_authentication(email: "chris.wittenbach@att.net") unless u266.valid?
    unless u266.arms.attached?
      u266.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/312.gif'), filename: '312.gif', content_type: 'images/gif');
    end
    p266 = Peer.create(user: u266, type: 'Pelican', elevated_by: "Cameron & Amalie", elevation_date: Date.parse("2014-09-06"), active: true, vigilant: false, bio: "From the Pentamere Region (Kalamazoo, Michigan); \*\*\*  Reigned with Lucien Philip deBordeaux - May 2013 to Oct 2013; \*\*\*\*  Countess 05 Oct, 2013 (A.S. 48); \*\* Order of the Rose 05 Oct, 2013 (A.S. 48); \*\* Order of the Pelican 06 Sep, 2014 (A.S. 49); \*\* Award of the Sapphire 14 Feb, 2009 (A.S. 43); \*\* Royal Augmentation of Arms 16 Sep, 2006 (A.S. 41); \*\* Court Baroness 15 May, 2004 (A.S. 39); \*\* Order of the Dragon\'s Heart 17 Jan, 2004 (A.S. 38); \*\* Award of the Purple Fret 09 Feb, 2002 (A.S. 36); \*\* Order of the Willow 24 Jun, 2000 (A.S. 35); \*\* Award of Arms 14 Aug, 1997 (A.S. 32)")
    p266.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/312.png'), filename: '312.png', content_type: 'images/png');
    u267 = User.find_or_create_by(sca_name: "Silverthorn of Dracunmor") do |user|
       user.email = "syrsilverthorn@gmail.com"
       user.password = "ionHca8p"
       user.modern_name = "Steve Moorhouse"
    end
    u267 = User.find_for_authentication(email: "syrsilverthorn@gmail.com") unless u267.valid?
    unless u267.arms.attached?
      u267.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/313.gif'), filename: '313.gif', content_type: 'images/gif');
    end
    p267 = Peer.create(user: u267, type: 'Pelican', elevated_by: "", elevation_date: Date.parse("2015-01-10"), active: true, vigilant: false, bio: "")
    p267.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/313.png'), filename: '313.png', content_type: 'images/png');
    u268 = User.find_or_create_by(sca_name: "Dougale MacAlestyr") do |user|
       user.email = "scadougale@gmail.com"
       user.password = "t9TORC0z"
       user.modern_name = ""
    end
    u268 = User.find_for_authentication(email: "scadougale@gmail.com") unless u268.valid?
    unless u268.arms.attached?
      u268.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/314.gif'), filename: '314.gif', content_type: 'images/gif');
    end
    p268 = Peer.create(user: u268, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-09-13"), active: true, vigilant: false, bio: "I\'m a big fan of the Middle Wiki  Give it a poke and see if it would work for you: http://middlewiki.midrealm.org/index.php/Dougale\_MacAlestyr")
    p268.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/314.png'), filename: '314.png', content_type: 'images/png');
    u269 = User.find_or_create_by(sca_name: "Wilhelm Michalik") do |user|
       user.email = "mmihallik@gmail.com"
       user.password = "YKlU0Yt7"
       user.modern_name = "Michael Mihallik"
    end
    u269 = User.find_for_authentication(email: "mmihallik@gmail.com") unless u269.valid?
    unless u269.arms.attached?
      u269.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/315.gif'), filename: '315.gif', content_type: 'images/gif');
    end
    p269 = Peer.create(user: u269, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-09-13"), active: true, vigilant: false, bio: "")
    p269.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/315.png'), filename: '315.png', content_type: 'images/png');
    u270 = User.find_or_create_by(sca_name: "Keiley Duchem") do |user|
       user.email = "KeileyDuchem@gmail.com"
       user.password = "2eUovOq2"
       user.modern_name = "Jenna Klauss"
    end
    u270 = User.find_for_authentication(email: "KeileyDuchem@gmail.com") unless u270.valid?
    p270 = Peer.create(user: u270, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-09-13"), active: true, vigilant: false, bio: "")
    p270.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/316.png'), filename: '316.png', content_type: 'images/png');
    u271 = User.find_or_create_by(sca_name: "Gianetta Andreini da Vicenza") do |user|
       user.email = "jenrsmall@yahoo.com"
       user.password = "qJqAdK2O"
       user.modern_name = "Jen Small"
    end
    u271 = User.find_for_authentication(email: "jenrsmall@yahoo.com") unless u271.valid?
    unless u271.arms.attached?
      u271.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/287.gif'), filename: '287.gif', content_type: 'images/gif');
    end
    p271 = Peer.create(user: u271, type: 'Pelican', elevated_by: "Savaric and Juliana", elevation_date: Date.parse("2012-08-10"), active: true, vigilant: false, bio: "")
    p271.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/287.png'), filename: '287.png', content_type: 'images/png');
    u272 = User.find_or_create_by(sca_name: "Peregren the Lost") do |user|
       user.email = "ptl@mindless.com"
       user.password = "25ijVW3J"
       user.modern_name = "Richard Craig"
    end
    u272 = User.find_for_authentication(email: "ptl@mindless.com") unless u272.valid?
    p272 = Peer.create(user: u272, type: 'Pelican', elevated_by: "Savaric and Julianna", elevation_date: Date.parse("2012-09-08"), active: true, vigilant: false, bio: "")
    u273 = User.find_or_create_by(sca_name: "Astrid of the Yellow Rose") do |user|
       user.email = "polaris.signet@gmail.com"
       user.password = "SwTa9Rtx"
       user.modern_name = "Nanci Nedweski"
    end
    u273 = User.find_for_authentication(email: "polaris.signet@gmail.com") unless u273.valid?
    unless u273.arms.attached?
      u273.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/289.gif'), filename: '289.gif', content_type: 'images/gif');
    end
    p273 = Peer.create(user: u273, type: 'Pelican', elevated_by: "Hagan & Eilis", elevation_date: Date.parse("2007-12-08"), active: true, vigilant: false, bio: "I\'m the Astrid - if you need something or need help with something - I\'ll either help you or find someone who can help you ... My father always said many hands make light work - those are wise words, my friends! And it\'s more fun to have more hands tackling a job - no matter what it is!")
    p273.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/289.png'), filename: '289.png', content_type: 'images/png');
    u274 = User.find_or_create_by(sca_name: "Nezkha Kiriena Petrova") do |user|
       user.email = "Nezkha@yahoo.com"
       user.password = "Vif7NXTN"
       user.modern_name = "Wendy Wallisch"
    end
    u274 = User.find_for_authentication(email: "Nezkha@yahoo.com") unless u274.valid?
    p274 = Peer.create(user: u274, type: 'Pelican', elevated_by: "Alric and Katherine", elevation_date: Date.parse("2018-09-08"), active: true, vigilant: false, bio: "")
    p274.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/370.png'), filename: '370.png', content_type: 'images/png');
    u275 = User.find_or_create_by(sca_name: "Peter Grau von Bremen") do |user|
       user.email = "petergrau@midrealm.org"
       user.password = "zgghomhh"
       user.modern_name = "Paul Friebus"
    end
    u275 = User.find_for_authentication(email: "petergrau@midrealm.org") unless u275.valid?
    unless u275.arms.attached?
      u275.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/371.gif'), filename: '371.gif', content_type: 'images/gif');
    end
    p275 = Peer.create(user: u275, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "I have had the honor of serving in many roles:  
  
 
- Constellation Regional Seneschal
- Vigilant to the Order of the Pelican 
- Seneschal of the Shire of Mynydd Seren (again!)   
 
- Mynydd Seren Pursuivant   
 
- Constellation Regional and Regional XO, Rapier Army   
 
- XO to Warder Adam MacAoidh (Lt. General, Rapier);   
 
- Lt. General, Rapier-Dragon Army  
 
- Head of Court for Their Majesties Cameron and Amalie II 
   
  
  I owe much to my mentors:   
 
- Cadet to Meister Uadahlrich von Sassmannshausen   
 
- Former Protege to Mistress Moira MacGillavrey   
 
- Former Apprentice to Meister Christian Fournier
  
  
 I have but one Provost, Warder Moira Eiriksdottir; and one cadet, Forester Aidan Tyrvason.")
    p275.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/371.png'), filename: '371.png', content_type: 'images/png');
    u276 = User.find_or_create_by(sca_name: "Dmitrii Zhirov") do |user|
       user.email = "dmitriizhirov@gmail.com"
       user.password = "xChwYJxw"
       user.modern_name = "Mike Cermak"
    end
    u276 = User.find_for_authentication(email: "dmitriizhirov@gmail.com") unless u276.valid?
    p276 = Peer.create(user: u276, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u277 = User.find_or_create_by(sca_name: "Elayne Thorne") do |user|
       user.email = "ehec53@yahoo.com"
       user.password = "Vt7QVIR8"
       user.modern_name = "Elaine Hecathorn"
    end
    u277 = User.find_for_authentication(email: "ehec53@yahoo.com") unless u277.valid?
    p277 = Peer.create(user: u277, type: 'Pelican', elevated_by: "A'Kos and Bella", elevation_date: Date.parse("2019-03-30"), active: true, vigilant: false, bio: "")
    u278 = User.find_or_create_by(sca_name: "Gareth Thorne") do |user|
       user.email = "garethorne@yahoo.com"
       user.password = "w1oS63Cj"
       user.modern_name = "Gary Hecathorn"
    end
    u278 = User.find_for_authentication(email: "garethorne@yahoo.com") unless u278.valid?
    p278 = Peer.create(user: u278, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u279 = User.find_or_create_by(sca_name: "Kira Kojirou Tokiakira") do |user|
       user.email = "mdjohnson2112@gmail.com"
       user.password = "LTm9FdqG"
       user.modern_name = "Mike Johnson"
    end
    u279 = User.find_for_authentication(email: "mdjohnson2112@gmail.com") unless u279.valid?
    unless u279.arms.attached?
      u279.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/375.gif'), filename: '375.gif', content_type: 'images/gif');
    end
    p279 = Peer.create(user: u279, type: 'Pelican', elevated_by: "A'kos and Bella", elevation_date: Date.parse("2019-03-23"), active: true, vigilant: false, bio: "")
    p279.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/375.png'), filename: '375.png', content_type: 'images/png');
    u280 = User.find_or_create_by(sca_name: "Seamus MacBain") do |user|
       user.email = "seamus@occamsconspiracy.net"
       user.password = "G4EaouO8"
       user.modern_name = ""
    end
    u280 = User.find_for_authentication(email: "seamus@occamsconspiracy.net") unless u280.valid?
    p280 = Peer.create(user: u280, type: 'Pelican', elevated_by: "A'kos and Bella", elevation_date: Date.parse("2019-05-04"), active: true, vigilant: false, bio: "")
    p280.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/376.png'), filename: '376.png', content_type: 'images/png');
    u281 = User.find_or_create_by(sca_name: "Fergus MacPherson") do |user|
       user.email = "baronfergusmacpherson@gmail.com"
       user.password = "OOYqJXtD"
       user.modern_name = "Jeremy Glick"
    end
    u281 = User.find_for_authentication(email: "baronfergusmacpherson@gmail.com") unless u281.valid?
    p281 = Peer.create(user: u281, type: 'Pelican', elevated_by: "Edmund and Kateryn", elevation_date: Date.parse("2019-08-31"), active: true, vigilant: false, bio: "")
    p281.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/377.png'), filename: '377.png', content_type: 'images/png');
    u282 = User.find_or_create_by(sca_name: "Aelf of Kingscrossing") do |user|
       user.email = "aelfkingsxing@hotmail.com"
       user.password = "Cns89LaB"
       user.modern_name = ""
    end
    u282 = User.find_for_authentication(email: "aelfkingsxing@hotmail.com") unless u282.valid?
    p282 = Peer.create(user: u282, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u283 = User.find_or_create_by(sca_name: "Gwenllyen the Minstrel") do |user|
       user.email = "hollyharpist@yahoo.com"
       user.password = "MUh3qz2L"
       user.modern_name = "Janet Scheltema"
    end
    u283 = User.find_for_authentication(email: "hollyharpist@yahoo.com") unless u283.valid?
    unless u283.arms.attached?
      u283.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/379.gif'), filename: '379.gif', content_type: 'images/gif');
    end
    p283 = Peer.create(user: u283, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    p283.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/379.png'), filename: '379.png', content_type: 'images/png');
    u284 = User.find_or_create_by(sca_name: "Emer von Atzinger") do |user|
       user.email = "Emerpelican@gmail.com"
       user.password = "5yJRWRHR"
       user.modern_name = ""
    end
    u284 = User.find_for_authentication(email: "Emerpelican@gmail.com") unless u284.valid?
    p284 = Peer.create(user: u284, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u285 = User.find_or_create_by(sca_name: "Sorcha Fraser") do |user|
       user.email = "Sorcha80@gmail.com"
       user.password = "GbZblSpm"
       user.modern_name = "Val Eisenberg"
    end
    u285 = User.find_for_authentication(email: "Sorcha80@gmail.com") unless u285.valid?
    p285 = Peer.create(user: u285, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2019-09-14"), active: true, vigilant: false, bio: "")
    p285.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/381.png'), filename: '381.png', content_type: 'images/png');
    u286 = User.find_or_create_by(sca_name: "Angelique d'Herisson") do |user|
       user.email = "scahedgehog@gmail.com"
       user.password = "vOVCL0Mc"
       user.modern_name = "Renee LeVeque"
    end
    u286 = User.find_for_authentication(email: "scahedgehog@gmail.com") unless u286.valid?
    p286 = Peer.create(user: u286, type: 'Pelican', elevated_by: "Savaric & Julianna", elevation_date: Date.parse("2012-07-14"), active: true, vigilant: false, bio: "")
    p286.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/290.png'), filename: '290.png', content_type: 'images/png');
    u287 = User.find_or_create_by(sca_name: "Alzbeta Michalik") do |user|
       user.email = "baronowaalzbeta@gmail.com"
       user.password = "K7FMfZVQ"
       user.modern_name = "Stacey Mihallik"
    end
    u287 = User.find_for_authentication(email: "baronowaalzbeta@gmail.com") unless u287.valid?
    unless u287.arms.attached?
      u287.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/299.gif'), filename: '299.gif', content_type: 'images/gif');
    end
    p287 = Peer.create(user: u287, type: 'Pelican', elevated_by: "Lucien and Catarina", elevation_date: Date.parse("2013-08-24"), active: true, vigilant: false, bio: "")
    p287.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/299.png'), filename: '299.png', content_type: 'images/png');
    u288 = User.find_or_create_by(sca_name: "Alaric Le Fevre") do |user|
       user.email = "drtjmiller@gmail.com"
       user.password = "8LN7JCXI"
       user.modern_name = "Tim Miller"
    end
    u288 = User.find_for_authentication(email: "drtjmiller@gmail.com") unless u288.valid?
    p288 = Peer.create(user: u288, type: 'Pelican', elevated_by: "Savaric and Julianna", elevation_date: Date.parse("2012-08-09"), active: true, vigilant: false, bio: "")
    p288.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/291.png'), filename: '291.png', content_type: 'images/png');
    u289 = User.find_or_create_by(sca_name: "Caitriona Mac Dhonnachaidh") do |user|
       user.email = "cmacdhonnachaidh@gmail.com"
       user.password = "ZFQ74IHn"
       user.modern_name = "Kathleen Dyer"
    end
    u289 = User.find_for_authentication(email: "cmacdhonnachaidh@gmail.com") unless u289.valid?
    p289 = Peer.create(user: u289, type: 'Pelican', elevated_by: "Savaric and Julianna", elevation_date: Date.parse("2012-08-25"), active: true, vigilant: false, bio: "_Caitriona was born in 1545 in central Scotland and moved to Portsmouth, England where she manages the family business while her husband is often overseas securing spices and trade goods from the far East.  She stays busy by entertaining extravagantly whenever possible.  _

_Specific areas of interest are culinary research, book arts, and embellishment and lately, a certain fascination with later period military armaments._

I have experience as a regional seneschal, pursuivant, kitchener and event steward.  My background includes a degree in Industrial and Organization Psychology, which focuses on group dynamics and helping groups of people work together effectively.   I'm passionate about getting interested people involved in the Society doing the things they love.")
    p289.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/292.png'), filename: '292.png', content_type: 'images/png');
    u290 = User.find_or_create_by(sca_name: "Francesca de Onorati") do |user|
       user.email = "snostorm55@yahoo.com"
       user.password = "RBo8OgtQ"
       user.modern_name = "Norma Storms"
    end
    u290 = User.find_for_authentication(email: "snostorm55@yahoo.com") unless u290.valid?
    unless u290.arms.attached?
      u290.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/293.gif'), filename: '293.gif', content_type: 'images/gif');
    end
    p290 = Peer.create(user: u290, type: 'Pelican', elevated_by: "Savaric and Julianna", elevation_date: Date.parse("2012-09-08"), active: true, vigilant: false, bio: "")
    p290.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/293.png'), filename: '293.png', content_type: 'images/png');
    u291 = User.find_or_create_by(sca_name: "Kendra Cameron") do |user|
       user.email = "kendra.newgirl@gmail.com"
       user.password = "LgXH1V6q"
       user.modern_name = "Kendra Vail"
    end
    u291 = User.find_for_authentication(email: "kendra.newgirl@gmail.com") unless u291.valid?
    p291 = Peer.create(user: u291, type: 'Pelican', elevated_by: "Cameron & Amalie II", elevation_date: Date.parse("2016-08-27"), active: true, vigilant: false, bio: "")
    p291.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/333.png'), filename: '333.png', content_type: 'images/png');
    u292 = User.find_or_create_by(sca_name: "Justice McArtain") do |user|
       user.email = "justicenapier@gmail.com"
       user.password = "Vw9yj2fr"
       user.modern_name = "Justice Napier"
    end
    u292 = User.find_for_authentication(email: "justicenapier@gmail.com") unless u292.valid?
    p292 = Peer.create(user: u292, type: 'Pelican', elevated_by: "Cameron & Amalie II", elevation_date: Date.parse("2016-08-27"), active: true, vigilant: false, bio: "")
    p292.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/334.png'), filename: '334.png', content_type: 'images/png');
    u293 = User.find_or_create_by(sca_name: "Anastasiia Kyrilovna Ivanova") do |user|
       user.email = "anastasia@ameritech.net"
       user.password = "waH4Ubpk"
       user.modern_name = "Carole McCallister"
    end
    u293 = User.find_for_authentication(email: "anastasia@ameritech.net") unless u293.valid?
    unless u293.arms.attached?
      u293.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/300.gif'), filename: '300.gif', content_type: 'images/gif');
    end
    p293 = Peer.create(user: u293, type: 'Pelican', elevated_by: "Cellach & Vukasin", elevation_date: Date.parse("2013-10-05"), active: true, vigilant: false, bio: "I think my SCA superpower is to be able to network artisans together so they can teach each other.  Awards: Pelican, Cellach & Vukasin I, vigiled by Lucien & Catarina Court Baroness, Edmund & Kateryn IV Dragon\'s Heart, Alaric & Noelle Willow, Edmund & Kateryn II Doe\'s Grace, Edmund & Kateryn III Purple Fret, Pieter & Nan Astrid Award of Arms, Comar & Lisa Gilded Reed (Middles Marches Baronial Arts Award), Thomas & Gretchen")
    p293.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/300.png'), filename: '300.png', content_type: 'images/png');
    u294 = User.find_or_create_by(sca_name: "Rowan Connor") do |user|
       user.email = "baronessrowanconnor@yahoo.com"
       user.password = "7JcL0a32"
       user.modern_name = ""
    end
    u294 = User.find_for_authentication(email: "baronessrowanconnor@yahoo.com") unless u294.valid?
    p294 = Peer.create(user: u294, type: 'Pelican', elevated_by: "Cellach and Vukasin", elevation_date: Date.parse("2014-01-25"), active: true, vigilant: false, bio: "baronessrowanconnor@yahoo.com")
    p294.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/301.png'), filename: '301.png', content_type: 'images/png');
    u296 = User.find_or_create_by(sca_name: "Maximilian der Zauberer") do |user|
       user.email = "scheltem@gmail.com"
       user.password = "5KmEAtLz"
       user.modern_name = "Bob Scheltema"
    end
    u296 = User.find_for_authentication(email: "scheltem@gmail.com") unless u296.valid?
    unless u296.arms.attached?
      u296.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/303.gif'), filename: '303.gif', content_type: 'images/gif');
    end
    p296 = Peer.create(user: u296, type: 'Pelican', elevated_by: "Cellach and Vukasin", elevation_date: Date.parse("2014-02-15"), active: true, vigilant: false, bio: "To learn more about Max, go here: [Max\'s Personal Web Page](http://michiganleftturn.org/Bob_1.html)")
    p296.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/303.png'), filename: '303.png', content_type: 'images/png');
    u297 = User.find_or_create_by(sca_name: "Radegund of Lutra") do |user|
       user.email = "r.millersansotta@gmail.com"
       user.password = "sC9ykPcI"
       user.modern_name = "RoseAnn Miller"
    end
    u297 = User.find_for_authentication(email: "r.millersansotta@gmail.com") unless u297.valid?
    p297 = Peer.create(user: u297, type: 'Pelican', elevated_by: "Cellach and Vukasin", elevation_date: Date.parse("2014-02-15"), active: true, vigilant: false, bio: "")
    p297.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/304.png'), filename: '304.png', content_type: 'images/png');
    u298 = User.find_or_create_by(sca_name: "Lancelin Peregrinus") do |user|
       user.email = "lancelin@rootcentral.org"
       user.password = "Oakbh6BI"
       user.modern_name = "Grant Root"
    end
    u298 = User.find_for_authentication(email: "lancelin@rootcentral.org") unless u298.valid?
    unless u298.arms.attached?
      u298.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/294.gif'), filename: '294.gif', content_type: 'images/gif');
    end
    p298 = Peer.create(user: u298, type: 'Pelican', elevated_by: "Savaric and Julianna", elevation_date: Date.parse("2012-09-08"), active: true, vigilant: false, bio: "A turn-of-the-14th-century squire and noble from the north of France, Lancelin has lived in the Marche of the Winged Hills within the Barony of the Flaming Gryphon since A.S. 17 (early 1983), and has held numerous offices in both groups. He is currently the Aethon Herald for the South Oaken region.

Lancelin is married to Bantiarna (Lady) Meadhbh ni Bhriain, and squired to Syr Berach de Winterbourne.

## Web Site   

[http://www.rootcentral.org/lancelin/](http://www.rootcentral.org/lancelin/)

## Current Offices

| Office | From |
| --- | --- |
| Aethon Herald | 6/2010 |
| Flaming Gryphon Web Minister | 3/1996 |
| Flaming Gryphon Keeper of the Rolls | 5/1989 |

## Past Offices

| Office | From | To |
| --- | --- | --- |
| Winged Hills Seneschal | 6/2011 | 9/2016 |
| Winged Hills Seneschal | 3/1997 | 9/2000 |
| Flaming Gryphon Clerk of Precedence | 1/1996 | 1/2017 |
| Flaming Gryphon Pursuivant | 6/1992 | 1/1996 |
| Flaming Gryphon Baronial Champion | 10/1989 | 10/1990 |
| Winged Hills Pursuivant | 12/1988 | 9/1992 |
| Flaming Gryphon Seneschal | 1/1987 | 5/1989 |
| Flaming Gryphon Chronicler | 9/1984 | 1/1987 |")
    p298.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/294.png'), filename: '294.png', content_type: 'images/png');
    u299 = User.find_or_create_by(sca_name: "Stephan Calvert deGrey") do |user|
       user.email = "old05g@gmail.com"
       user.password = "IL06fKib"
       user.modern_name = "Rich Goranson"
    end
    u299 = User.find_for_authentication(email: "old05g@gmail.com") unless u299.valid?
    unless u299.arms.attached?
      u299.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/295.gif'), filename: '295.gif', content_type: 'images/gif');
    end
    p299 = Peer.create(user: u299, type: 'Pelican', elevated_by: "Isenwulf and Rosalinda (Ã†thelmearc)", elevation_date: Date.parse("2011-12-10"), active: true, vigilant: false, bio: "Master of the Pelican - 10 December A.S. XLVI   
 Companion of the Millrind - 15 November A.S. XLIII   
 Companion of the Keystone - 31 January A.S. XXXII   
 Award of Arms - 1 December A.S. XXV   
 Sigil of Aethelmearc - 6 June A.S. XXVII   
 Venerable Order of the Ice Dragon - 11 March A.S. XXIX   
  
  Former squire to Sir Raimund of the Strait (East), squired 16 August A.S. XXI at Pennsic XV")
    p299.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/295.png'), filename: '295.png', content_type: 'images/png');
    u300 = User.find_or_create_by(sca_name: "Philippe de Lyon") do |user|
       user.email = "mandritta@yahoo.com"
       user.password = "gQeqFNmG"
       user.modern_name = "TJ Harmon"
    end
    u300 = User.find_for_authentication(email: "mandritta@yahoo.com") unless u300.valid?
    unless u300.arms.attached?
      u300.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/296.gif'), filename: '296.gif', content_type: 'images/gif');
    end
    p300 = Peer.create(user: u300, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    p300.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/296.png'), filename: '296.png', content_type: 'images/png');
    u301 = User.find_or_create_by(sca_name: "Giovanna Adimari") do |user|
       user.email = "elaine242@gmail.com"
       user.password = "KZ8PAD66"
       user.modern_name = "Anne"
    end
    u301 = User.find_for_authentication(email: "elaine242@gmail.com") unless u301.valid?
    unless u301.arms.attached?
      u301.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/297.gif'), filename: '297.gif', content_type: 'images/gif');
    end
    p301 = Peer.create(user: u301, type: 'Pelican', elevated_by: "Dag and Anne Marie", elevation_date: Date.parse("2013-04-20"), active: true, vigilant: false, bio: "")
    p301.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/297.png'), filename: '297.png', content_type: 'images/png');
    u302 = User.find_or_create_by(sca_name: "Hillary of Langeforde") do |user|
       user.email = "jeffnaggie@aol.com"
       user.password = "eVBoorty"
       user.modern_name = "Aggie Powell-Berger"
    end
    u302 = User.find_for_authentication(email: "jeffnaggie@aol.com") unless u302.valid?
    unless u302.arms.attached?
      u302.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/298.gif'), filename: '298.gif', content_type: 'images/gif');
    end
    p302 = Peer.create(user: u302, type: 'Pelican', elevated_by: "Dag and AnneMarie", elevation_date: Date.parse("2013-04-13"), active: true, vigilant: false, bio: "")
    p302.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/298.png'), filename: '298.png', content_type: 'images/png');
    u303 = User.find_or_create_by(sca_name: "Nyilas Kazmer") do |user|
       user.email = "lordkazmer@aol.com"
       user.password = "nZD7hnsM"
       user.modern_name = "George Martin"
    end
    u303 = User.find_for_authentication(email: "lordkazmer@aol.com") unless u303.valid?
    unless u303.arms.attached?
      u303.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/309.gif'), filename: '309.gif', content_type: 'images/gif');
    end
    p303 = Peer.create(user: u303, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-08-07"), active: true, vigilant: false, bio: "SCA member since A.S 23 (1988).   Local group: The Riding of Hawkland Moor (a Canton of the Barony of Northwoods).  Current offices: Group Knight\'s Marshal for Hawkland Moor, Marshal of the field for: Armored Combat, Target Archery, Thrown Weapons, Youth Combat.  Past offices: Society Deputy Marshal for Youth Combat, 2014-2018 Middle Kingdom Deputy Earl Marshal for Youth Combat, 2011-2014, Pentamere Regional Youth Combat Marshal, 2008 - 2011, Canton Herald, Canton Exchequer.  Authorized in Armored Combat 1992, Archery Marshal 1989, Youth Combat Marshal 2000, Armored Combat Marshal 2004, Thrown Weapons Marshal 2004.  Squired to Sir Timothy Garagchan o\'Leitrim, KSCA, OP.  Apprenticed to Master Nigellus Le Haie, OL.  Interests: Youth activities, woodworking (bowyer), leatherworking, metalworking, weaving, brewing.  Other SCA awards: AoA, April 1989; ADB, May 1990; APF, July 1990; OSO, Jan 1995; ODH, Feb 2011.")
    p303.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/309.png'), filename: '309.png', content_type: 'images/png');
    u304 = User.find_or_create_by(sca_name: "Gregoire de Lyon") do |user|
       user.email = "gregoiredelyon@gmail.com"
       user.password = "eA94No0h"
       user.modern_name = ""
    end
    u304 = User.find_for_authentication(email: "gregoiredelyon@gmail.com") unless u304.valid?
    unless u304.arms.attached?
      u304.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/318.gif'), filename: '318.gif', content_type: 'images/gif');
    end
    p304 = Peer.create(user: u304, type: 'Pelican', elevated_by: "Ragnvaldr & Arabella III",  active: true, vigilant: false, bio: "")
    p304.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/318.png'), filename: '318.png', content_type: 'images/png');
    u305 = User.find_or_create_by(sca_name: "Marie la Fauconniere") do |user|
       user.email = "macgregorscairn@gmail.com"
       user.password = "Sf0do6y7"
       user.modern_name = "Nita Lewis"
    end
    u305 = User.find_for_authentication(email: "macgregorscairn@gmail.com") unless u305.valid?
    unless u305.arms.attached?
      u305.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/311.gif'), filename: '311.gif', content_type: 'images/gif');
    end
    p305 = Peer.create(user: u305, type: 'Pelican', elevated_by: "Cameron and Amalie", elevation_date: Date.parse("2014-09-13"), active: true, vigilant: false, bio: "Marie la Fauconniere was born in the closing years of the 13th century to the seigneur of a minor estate near Calais. She was fortunate enough to be chosen as a play-fellow to Jeanne de Coucy and shared her remarkably broad education until the age of 14, when her parents wed her to a Polish nobleman, Stefan of Kraków. Stefan had been gifted by King Philippe with an estate in Picardy known as Chateau Faucon, as recompense for his martial services to the crown.   Luckily for Marie, Stefan was a good and kindly man whom she came to love. His tenants called her €œla Fauconniere€ for her love of hunting and to distinguish her from his sister who was also named Marie. Stefan and Marie had one daughter before a sudden fever claimed Stefan€™s life in 1328.    In 1331, while visiting Calais, Marie made the acquaintance of a Scotsman who had been in the company of James Douglas on his ill-fated expedition to the Holy Land to bury the heart of King Robert Bruce. She and Lochlainn MacGrioghair discovered that they shared many tastes and interests and it rapidly became clear that they were destined for each other. Marie signed over her French lands in favor of her daughter and departed for the Scottish highlands.   Dame Marie now lives quietly as a twice-widowed lady of good breeding and moderate resources should, spending her days working in the herb garden and still-room and tending to the needs of the estate; but she can still often be heard singing as she hunts on the moors, oversees the kitchen, or does needlework by the warmth of the fire.    In the SCA, Marie teaches basic sewing skills, food preservation, and the making of Period-type herbal scents and cosmetics; fences (poorly but enthusiastically) and is a Marshal of the Field; writes and performs music and poetry; and plays with wood, fiber, and/or ink and paint whenever possible. She has been Meadows Herald, Regional Seneschal, and local Seneschal, Exchequer, and Chatelaine. In the modern world she is a sales-data and process analyst working for a major luxury-wine importer in NE Illinois.")
    p305.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/311.png'), filename: '311.png', content_type: 'images/png');
    u306 = User.find_or_create_by(sca_name: "Anton du Marais") do |user|
       user.email = "rapieranton@gmail.com"
       user.password = "XOMA86S6"
       user.modern_name = "Clint Anderson"
    end
    u306 = User.find_for_authentication(email: "rapieranton@gmail.com") unless u306.valid?
    unless u306.arms.attached?
      u306.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/332.gif'), filename: '332.gif', content_type: 'images/gif');
    end
    p306 = Peer.create(user: u306, type: 'Pelican', elevated_by: "Cameron & Amalie II",  active: true, vigilant: false, bio: "")
    p306.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/332.png'), filename: '332.png', content_type: 'images/png');
    u307 = User.find_or_create_by(sca_name: "Maleachi Wulfhart") do |user|
       user.email = "malaechi@gmail.com"
       user.password = "GNAseSuB"
       user.modern_name = "Jack Needles"
    end
    u307 = User.find_for_authentication(email: "malaechi@gmail.com") unless u307.valid?
    unless u307.arms.attached?
      u307.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/329.gif'), filename: '329.gif', content_type: 'images/gif');
    end
    p307 = Peer.create(user: u307, type: 'Pelican', elevated_by: "Cameron & Amalie II", elevation_date: Date.parse("2016-10-08"), active: true, vigilant: false, bio: "")
    p307.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/329.png'), filename: '329.png', content_type: 'images/png');
    u308 = User.find_or_create_by(sca_name: "Gunnar Sigurdsson") do |user|
       user.email = "thomascherry.photo@gmail.com"
       user.password = "bLQnAWb2"
       user.modern_name = "Tom Cherry"
    end
    u308 = User.find_for_authentication(email: "thomascherry.photo@gmail.com") unless u308.valid?
    unless u308.arms.attached?
      u308.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/317.gif'), filename: '317.gif', content_type: 'images/gif');
    end
    p308 = Peer.create(user: u308, type: 'Pelican', elevated_by: "Cadogan and AnnMarie", elevation_date: Date.parse("2015-04-18"), active: true, vigilant: false, bio: "Gunnar is a late 10th-Century Icelander, and immigrated in the second wave of Settlement around 995CE. He is well-traveled, with friends among the Celts, Normans and Saxons, in addition to close ties to his native Norway. He cultivated a lasting friendship with the Mongols of the Great Dark Horde during travels in the Far East, and was invited to join their number as a Brother of the House. He is also a member of House Vexillarius. When not on an expedition, Gunnar tends his flocks and fields along the north central coast of Iceland.

My areas of interest in the SCA are event planning, group administration, communications and event photography; brewing; and the arts martial.

I was a Protege to Mistress Brise Sanguin, and was elevated by Cadogan and AnnMarie at Grand Tournament of the Unicorn on April 18, A.S. 49. I was a Squire to Sir Ragnar Karlsson until my elevation.

The image of my heraldry was created by Eva vanOldebroek for my Grant of Arms scroll.")
    p308.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/317.png'), filename: '317.png', content_type: 'images/png');
    u309 = User.find_or_create_by(sca_name: "Halla of Mugmort") do |user|
       user.email = "hallaofmugmort@aol.com"
       user.password = "tDpaYuJg"
       user.modern_name = "Halle Snyder"
    end
    u309 = User.find_for_authentication(email: "hallaofmugmort@aol.com") unless u309.valid?
    p309 = Peer.create(user: u309, type: 'Pelican', elevated_by: "Nikolai and Serena", elevation_date: Date.parse("2015-09-26"), active: true, vigilant: false, bio: " **I was placed on Vigil at Kingdom A&S 2015 by Rangvaldr and Arabella III, and elevated on September 26, 2015 by Nikolai and Serena.**   
  
  My commitment to Arts and Sciences service is constant and comprehensive. My Motto is **Service in Art, and Art in Service.** I have served closely under many good and productive Midrealm KMOAS, and I will use all the best practices from each of them to be a good KMOAS who increases and prospers the Arts and Sciences activities of the Midrealm during my tenure until Kingdom A&S 2019.  
  
  Some of my KMOAS projects include a new procedure for keeping A&S Faire Criteria updated, commencing with a complete review of all Criteria, revamping the Craftspersons Faires as a vehicle for developing A&S Warpoint artisans, developing a set of A&S rules in conjunction with the Marshallate for live action Martial arts Faires, and creating and revising some of the MOAS and tallyroom documentation.   
  
  As a new person in the SCA many years ago, I was introduced to service through doing demos for the local public schools, so A&S service has always been a part of my game. I was able find a niche with the A&S tallyroom crew around 2002, and eventually found my mentor there in Master Vorlin. I have been an entrant and a judge many times, and have served in every role in the tallyroom, Ogre, Adding Table, Runner, Data Entry, Judges and Entrants Check In. even serving as an Admin when we had to split the crew for multiple Faires on one day. I served as Judges Coordinator for two years, and helped to develop a method to schedule entries and judges to make Faire day go more smoothly.   
  
  Before I was KMOAS Midrealm, I was the Special Deputy Judges Coordinator, I have served as an officer at local, Baronial and Regional levels: RMOAS North Oaken, BMOAS Middle Marches, Signet Middle Marches, and Chatelaine for the Shire of Mugmort.  
  
 I also love to support other kinds of A&S emphasis events, I have been the co-Autocrat for events such as Baronial 12th Night, and Slavic University, as well as lending my support to a bid for a Known World Dance event while I was RMOAS.   
  
  At Pennsic 46, 2017 I took two Proteges, Freeman the Minstrel and Finnguala Ingen Ui HAirt. Both of these relationships are predicated on friendship, and our mutual service to and through the Arts, especially Music.   
  
  My Household, Holt Heroetes, has a strong tradition of service to the Crown. I am also a Sister of the Gilded Bees. I perform with Bardic Storm and Spirits of the Season.")
    p309.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/319.png'), filename: '319.png', content_type: 'images/png');
    u310 = User.find_or_create_by(sca_name: "Helena Sibylla") do |user|
       user.email = "helenasibylla@gmail.com"
       user.password = "Gz0SbZaD"
       user.modern_name = "Martha Sieting"
    end
    u310 = User.find_for_authentication(email: "helenasibylla@gmail.com") unless u310.valid?
    unless u310.arms.attached?
      u310.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/320.gif'), filename: '320.gif', content_type: 'images/gif');
    end
    p310 = Peer.create(user: u310, type: 'Pelican', elevated_by: "Ragnvaldr III & Arabella III", elevation_date: Date.parse("2015-06-27"), active: true, vigilant: false, bio: "")
    p310.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/320.png'), filename: '320.png', content_type: 'images/png');
    u311 = User.find_or_create_by(sca_name: "Rijckaert") do |user|
       user.email = "richardvanutrecht@gmail.com"
       user.password = "mYg6KN4E"
       user.modern_name = "Dan Peacock"
    end
    u311 = User.find_for_authentication(email: "richardvanutrecht@gmail.com") unless u311.valid?
    unless u311.arms.attached?
      u311.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/321.gif'), filename: '321.gif', content_type: 'images/gif');
    end
    p311 = Peer.create(user: u311, type: 'Pelican', elevated_by: "Ragnvaldr III and Arabella III", elevation_date: Date.parse("2015-09-19"), active: true, vigilant: false, bio: "Rijckaert (Richard in English speaking lands) is a 12th Century crusader from the Low Countries.   He went on crusade with other Flemmish knights, making it as far as Egypt.

 Richard is the current Kingdom web minister.")
    p311.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/321.png'), filename: '321.png', content_type: 'images/png');
    u312 = User.find_or_create_by(sca_name: "Eleanor von Atzinger") do |user|
       user.email = "ernfortney0324@msn.com"
       user.password = "TTSB9NDQ"
       user.modern_name = "Erin Fortney"
    end
    u312 = User.find_for_authentication(email: "ernfortney0324@msn.com") unless u312.valid?
    unless u312.arms.attached?
      u312.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/322.gif'), filename: '322.gif', content_type: 'images/gif');
    end
    p312 = Peer.create(user: u312, type: 'Pelican', elevated_by: "Nikolai & Serena", elevation_date: Date.parse("2015-12-05"), active: true, vigilant: false, bio: "")
    p312.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/322.png'), filename: '322.png', content_type: 'images/png');
    u313 = User.find_or_create_by(sca_name: "Elizabethe Alles") do |user|
       user.email = "lady.elizabethe@gmail.com"
       user.password = "y3vj3yDY"
       user.modern_name = "Ashley Smith"
    end
    u313 = User.find_for_authentication(email: "lady.elizabethe@gmail.com") unless u313.valid?
    unless u313.arms.attached?
      u313.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/323.gif'), filename: '323.gif', content_type: 'images/gif');
    end
    p313 = Peer.create(user: u313, type: 'Pelican', elevated_by: "Nikolai and Serena", elevation_date: Date.parse("2015-10-24"), active: true, vigilant: false, bio: "")
    p313.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/323.png'), filename: '323.png', content_type: 'images/png');
    u314 = User.find_or_create_by(sca_name: "Ellowyn Kittle von Drachenstein") do |user|
       user.email = "stephkitt1973@gmail.com"
       user.password = "NlH6hJmj"
       user.modern_name = "Stephanie Kittle"
    end
    u314 = User.find_for_authentication(email: "stephkitt1973@gmail.com") unless u314.valid?
    unless u314.arms.attached?
      u314.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/335.gif'), filename: '335.gif', content_type: 'images/gif');
    end
    p314 = Peer.create(user: u314, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2016-12-03"), active: true, vigilant: false, bio: "")
    p314.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/335.png'), filename: '335.png', content_type: 'images/png');
    u315 = User.find_or_create_by(sca_name: "Marissa von Atzinger") do |user|
       user.email = "marissavonatzinger@gmail.com"
       user.password = "kMiiFEYV"
       user.modern_name = "Marissa Williams"
    end
    u315 = User.find_for_authentication(email: "marissavonatzinger@gmail.com") unless u315.valid?
    p315 = Peer.create(user: u315, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2016-12-03"), active: true, vigilant: false, bio: "I reside in the Barony of the Flame, South Oaken, where I joined the Society in 2005.  I was put on vigil by King Cameron II and Queen Amalie II at Harvest Days in fall 2016, and elevated by King Edmund and Queen Kateryn at Christmas Tourney 2016.

I have enjoyed serving my Barony and my Kingdom in various capacities, and if you ever have questions about any of the following topics, please don't hesitate to contact me!

- SCA photography (I'm not a professional and don't speak much photography lingo, but I can give some tips and tricks, esp. for new photographers)
- Calligraphy and Illumination
- Serving as an Event Steward
- Serving as a Royalty Liaison 
- Serving as a Baronial Chronicler
- Serving as a Baronial Seneschal

In Service,

Dame Marissa von Atzinger")
    p315.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/336.png'), filename: '336.png', content_type: 'images/png');
    u316 = User.find_or_create_by(sca_name: "Alaina Blackram") do |user|
       user.email = "Ablackram1590@gmail.com"
       user.password = "UD93UNwr"
       user.modern_name = "Lisa Phillips"
    end
    u316 = User.find_for_authentication(email: "Ablackram1590@gmail.com") unless u316.valid?
    unless u316.arms.attached?
      u316.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/327.gif'), filename: '327.gif', content_type: 'images/gif');
    end
    p316 = Peer.create(user: u316, type: 'Pelican', elevated_by: "Nikolai and Serena", elevation_date: Date.parse("2016-02-13"), active: true, vigilant: false, bio: "")
    p316.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/327.png'), filename: '327.png', content_type: 'images/png');
    u317 = User.find_or_create_by(sca_name: "Crespine de la Vallee") do |user|
       user.email = " niralys@gmail.com"
       user.password = "DZNfTaSQ"
       user.modern_name = "Nira Lys Morning"
    end
    u317 = User.find_for_authentication(email: " niralys@gmail.com") unless u317.valid?
    unless u317.arms.attached?
      u317.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/325.gif'), filename: '325.gif', content_type: 'images/gif');
    end
    p317 = Peer.create(user: u317, type: 'Pelican', elevated_by: "Serena and Nikolai", elevation_date: Date.parse("2016-01-09"), active: true, vigilant: false, bio: "")
    p317.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/325.png'), filename: '325.png', content_type: 'images/png');
    u318 = User.find_or_create_by(sca_name: "Edward Foxley") do |user|
       user.email = "thegreyfox1@juno.com"
       user.password = "GfjDb7rd"
       user.modern_name = "Jason Butsch"
    end
    u318 = User.find_for_authentication(email: "thegreyfox1@juno.com") unless u318.valid?
    unless u318.arms.attached?
      u318.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/326.gif'), filename: '326.gif', content_type: 'images/gif');
    end
    p318 = Peer.create(user: u318, type: 'Pelican', elevated_by: "Nikolai and Serena", elevation_date: Date.parse("2016-04-02"), active: true, vigilant: false, bio: "Invested as the 6th Baron of Flaming Gryphon on April 2nd 2016.")
    p318.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/326.png'), filename: '326.png', content_type: 'images/png');
    u319 = User.find_or_create_by(sca_name: "Sarah of the Erie Sea") do |user|
       user.email = "saramof@aol.com"
       user.password = "eiaxlsXy"
       user.modern_name = "Sarah True"
    end
    u319 = User.find_for_authentication(email: "saramof@aol.com") unless u319.valid?
    p319 = Peer.create(user: u319, type: 'Pelican', elevated_by: "Nick and Serena", elevation_date: Date.parse("2016-04-02"), active: true, vigilant: false, bio: "DEM for Combat Archery.  Email link on the 35-Foot Spear website.")
    u320 = User.find_or_create_by(sca_name: "Genoveva von Lubeck") do |user|
       user.email = "genoveva.von.lubeck@gmail.com"
       user.password = "XnioChNv"
       user.modern_name = "Jennifer Marx"
    end
    u320 = User.find_for_authentication(email: "genoveva.von.lubeck@gmail.com") unless u320.valid?
    unless u320.arms.attached?
      u320.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/337.gif'), filename: '337.gif', content_type: 'images/gif');
    end
    p320 = Peer.create(user: u320, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2017-02-11"), active: true, vigilant: false, bio: "Genoveva loves to be involved and help at the Kingdom and Society level, and has a special place in her heart for Pennsic service. She is happy to help -- just ask!E-mail works best -- contact her at genoveva.von.lubeck (at) gmail [dot] com.

Currently the editor of The Pale, the Kingdom Cartographer, and the Web Deputy to the Kingdom Seneschal. At Pennsic, she is the Great Hall and Runestone Hill Scheduler, as well as the Pennsic Cartographer.

Genoveva has one protege: Baroness Hannah Schreiber")
    p320.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/337.png'), filename: '337.png', content_type: 'images/png');
    u321 = User.find_or_create_by(sca_name: "Gebhard Rauten") do |user|
       user.email = "gebhard.rauten@gmail.com"
       user.password = "6rUfRrcn"
       user.modern_name = "Dwain Crackle"
    end
    u321 = User.find_for_authentication(email: "gebhard.rauten@gmail.com") unless u321.valid?
    unless u321.arms.attached?
      u321.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/338.gif'), filename: '338.gif', content_type: 'images/gif');
    end
    p321 = Peer.create(user: u321, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2017-03-04"), active: true, vigilant: false, bio: "Elevated at Winter War Maneuvers (2017) by Edmund V and Kateryn V")
    p321.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/338.png'), filename: '338.png', content_type: 'images/png');
    u322 = User.find_or_create_by(sca_name: "Katarina Peregine") do |user|
       user.email = "katperegrine@gmail.com"
       user.password = "ztaYcyqc"
       user.modern_name = "Karen Ferguson Johnson"
    end
    u322 = User.find_for_authentication(email: "katperegrine@gmail.com") unless u322.valid?
    unless u322.arms.attached?
      u322.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/339.gif'), filename: '339.gif', content_type: 'images/gif');
    end
    p322 = Peer.create(user: u322, type: 'Pelican', elevated_by: "Edmund & Kateryn", elevation_date: Date.parse("2017-05-05"), active: true, vigilant: false, bio: "Member of the Marche of Gwyntarian, in the Barony of Brendoken. Presently, Chatelaine, Marche of Gwyntarian. Editorial contributor, Middlewiki.  On occasion: Feast prep crew since 1989 for Oaken cooks, particularly what is now known as Team Anubis. Waterbearer. Instructor (Mr. Pen is Your Friend, You CAN Illuminate), A&S Night Coordinator, Marche of Gwyntarian.  Formerly: Kingdom Chronicler, Midrealm. SCA 50 Year Social Media Director. Designer/copywriter SCA, Inc. recruitment brochures. Oaken Regional Chronicler. Gwyntarian seneschal. Deputy to the Kingdom Webminister. Deputy to the Kingdom Chronicler. Deputy to the Kingdom Chatelaine. Special Projects Manager, Society Chatelaine. Public Demonstration Coordinator, Marche of Gwyntarian. Chatelaine/Deputy, Brendoken, Public Demonstrations. Content Editor/Provider, midrealm.org. Retinue, Edmund and Kateryn III, IV, V.  Event steward: Coronations, Crown Tournament (Dag & AnneMarie II), RUM, local events.")
    p322.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/339.png'), filename: '339.png', content_type: 'images/png');
    u323 = User.find_or_create_by(sca_name: "Cynesige of Caernarfon") do |user|
       user.email = "cynesige.of.caernarfon@gmail.com"
       user.password = "T4YHc7tq"
       user.modern_name = "Aleceia Anderson"
    end
    u323 = User.find_for_authentication(email: "cynesige.of.caernarfon@gmail.com") unless u323.valid?
    unless u323.arms.attached?
      u323.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/341.gif'), filename: '341.gif', content_type: 'images/gif');
    end
    p323 = Peer.create(user: u323, type: 'Pelican', elevated_by: "Hauoc Bender & Ginevra da Ravenna - West Kingdom", elevation_date: Date.parse("2001-11-12"), active: true, vigilant: false, bio: "Recently moved to the Middle Kingdom from the Barony of the Far West in the West Kingdom. Now lives in South Oaken region in the incipient Shire of Austrigatt (Ashland, KY).   Since I reside so close to The Sylvan Kingdom of Æthelmearc, I like to slip across the border to play in their fields as well as ours.   email: cynesige.of.caernarfon@gmail.com")
    p323.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/341.png'), filename: '341.png', content_type: 'images/png');
    u324 = User.find_or_create_by(sca_name: "Lucius Aurelius Valharic") do |user|
       user.email = "valharic@hotmail.com"
       user.password = "uoLfjYxv"
       user.modern_name = "Thomas Noble"
    end
    u324 = User.find_for_authentication(email: "valharic@hotmail.com") unless u324.valid?
    p324 = Peer.create(user: u324, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-08-08"), active: true, vigilant: false, bio: "")
    p324.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/342.png'), filename: '342.png', content_type: 'images/png');
    u325 = User.find_or_create_by(sca_name: "Roana Aldinoch") do |user|
       user.email = "roana.aldinoch@gmail.com"
       user.password = "Y4FazcT3"
       user.modern_name = "Roana Isenholt"
    end
    u325 = User.find_for_authentication(email: "roana.aldinoch@gmail.com") unless u325.valid?
    unless u325.arms.attached?
      u325.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/345.gif'), filename: '345.gif', content_type: 'images/gif');
    end
    p325 = Peer.create(user: u325, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-05-06"), active: true, vigilant: false, bio: "Roana Aldinoch was born in the winter of 1169 in Totnes, England, the second youngest of seven. Raised by her father, a very wealthy minter, Roana received an education in philosophy, reading, and exchequery, things otherwise not approved for women. She married young, bore her first husband four children, and then did not weep at her husband\'s funeral six years after their wedding day. His income and sheep farm were left to her eldest son, in her keeping until the boy came of age. By the time he was able to do so, she had amassed enough wealth on her own to buy her own sheep farm, where she now lives in peaceful reverie, taking in the occasional lodger and selling her ale with great success.  
  
 Roana Isenholt works as a data analyst in healthcare. She\'s recently relocated to Portland, OR, to spend more time with her adult sons while her daughter attends college in Ames, IA. She enjoys organizing events in order to create places for others to live the dream. She spends her copious amounts of downtime (\*coughs\*) bookbinding, sewing, brewing, doing leather crafting, and generally avoiding sleep by finding that one more thing that she just \*has\* to learn about/do/see.")
    p325.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/345.png'), filename: '345.png', content_type: 'images/png');
    u326 = User.find_or_create_by(sca_name: "Aine ingen Neill mec Lugdech") do |user|
       user.email = "redanya@gmail.com"
       user.password = "IWnzHiBD"
       user.modern_name = "Deborah Hooper"
    end
    u326 = User.find_for_authentication(email: "redanya@gmail.com") unless u326.valid?
    p326 = Peer.create(user: u326, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-06-10"), active: true, vigilant: false, bio: "")
    p326.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/344.png'), filename: '344.png', content_type: 'images/png');
    u327 = User.find_or_create_by(sca_name: "Kriemhilt von Ebersberg") do |user|
       user.email = " kriemhiltve@gmail.com"
       user.password = "gOfchNPT"
       user.modern_name = "Sabine Lessing-Tyson"
    end
    u327 = User.find_for_authentication(email: " kriemhiltve@gmail.com") unless u327.valid?
    unless u327.arms.attached?
      u327.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/346.gif'), filename: '346.gif', content_type: 'images/gif');
    end
    p327 = Peer.create(user: u327, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-08-10"), active: true, vigilant: false, bio: "")
    p327.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/346.png'), filename: '346.png', content_type: 'images/png');
    u328 = User.find_or_create_by(sca_name: "Epona Brodin") do |user|
       user.email = "donplayleapfrogwithaunicorn@gmail.com"
       user.password = "z5mNzJnU"
       user.modern_name = " Rachel Scheffler"
    end
    u328 = User.find_for_authentication(email: "donplayleapfrogwithaunicorn@gmail.com") unless u328.valid?
    p328 = Peer.create(user: u328, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-08-26"), active: true, vigilant: false, bio: "")
    p328.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/347.png'), filename: '347.png', content_type: 'images/png');
    u329 = User.find_or_create_by(sca_name: "Maggie MacKeith") do |user|
       user.email = "mistressmaggiemackeith@gmail.com"
       user.password = "Is1RWHd8"
       user.modern_name = "Wendy Martin-Glick"
    end
    u329 = User.find_for_authentication(email: "mistressmaggiemackeith@gmail.com") unless u329.valid?
    unless u329.arms.attached?
      u329.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/348.gif'), filename: '348.gif', content_type: 'images/gif');
    end
    p329 = Peer.create(user: u329, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-09-02"), active: true, vigilant: false, bio: "I was the first dependent of Sigulf Karlnar, having become his protege in the Spring of 2003. Since joining the SCA in 1987, I have held a variety of offices; working at local, regional and kingdom levels. Recently, my husband and I completed our three year term as the first Baron and Baroness of Shadowed Stars and I am also the Kingdom Media Liaison. Being able to help other people is my greatest joy. As a Pelican, I plan to continue to mentor others, including my proteges, Zilia, Tegan, Kitsune, Astrid, and Kitta. I will look for new ways to help others find their passion in the Society and will then help match them with people and resources to pursue their part of the dream. If you see me, please know that I am someone who will help you or find you help, no matter the need. Please feel free to come and talk to me, anytime. I love making new friends!")
    p329.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/348.png'), filename: '348.png', content_type: 'images/png');
    u330 = User.find_or_create_by(sca_name: "Calybrid Ine Tere") do |user|
       user.email = "calybrid@gmail.com"
       user.password = "kwYVPbK1"
       user.modern_name = "Diana Bradburn"
    end
    u330 = User.find_for_authentication(email: "calybrid@gmail.com") unless u330.valid?
    p330 = Peer.create(user: u330, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-07-01"), active: true, vigilant: false, bio: "")
    p330.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/349.png'), filename: '349.png', content_type: 'images/png');
    u331 = User.find_or_create_by(sca_name: "Nina of the Lost Caverns") do |user|
       user.email = "mistressnina@oakenstaff.org"
       user.password = "y7TB8G5A"
       user.modern_name = "Kim Schreuders"
    end
    u331 = User.find_for_authentication(email: "mistressnina@oakenstaff.org") unless u331.valid?
    unless u331.arms.attached?
      u331.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/350.gif'), filename: '350.gif', content_type: 'images/gif');
    end
    p331 = Peer.create(user: u331, type: 'Pelican', elevated_by: "Michael & Sati - Artemisia", elevation_date: Date.parse("2009-06-20"), active: true, vigilant: false, bio: "Nina lives sometime in the early part of the SCA time period, often in the 5th century, often somewhere in post-roman Britain. No-one quite knows how she ended up with the name Nina, which does not appear to be a name in use in that time/place. She has traveled through many of the kingdoms of the Knowne World, and now lives in the Marche of Gwyntarian, in the Barony of Brendoken.  Kim is an Electrical/Computer Engineer who usually ends up trying to solve unsolvable problems, often using a confounding array of interdisciplinary techniques and technologies.")
    p331.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/350.png'), filename: '350.png', content_type: 'images/png');
    u332 = User.find_or_create_by(sca_name: "Soffya von Kulpe") do |user|
       user.email = "ladyvonkulp@gmail.com"
       user.password = "8hrqikhF"
       user.modern_name = "Judith Bolenbaugh"
    end
    u332 = User.find_for_authentication(email: "ladyvonkulp@gmail.com") unless u332.valid?
    unless u332.arms.attached?
      u332.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/351.gif'), filename: '351.gif', content_type: 'images/gif');
    end
    p332 = Peer.create(user: u332, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-07-08"), active: true, vigilant: false, bio: "")
    p332.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/351.png'), filename: '351.png', content_type: 'images/png');
    u333 = User.find_or_create_by(sca_name: "Gareth Ostwestly") do |user|
       user.email = "ostwestly@aol.com"
       user.password = "sHe1ifrf"
       user.modern_name = "Jeff Berger"
    end
    u333 = User.find_for_authentication(email: "ostwestly@aol.com") unless u333.valid?
    p333 = Peer.create(user: u333, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-08-26"), active: true, vigilant: false, bio: "")
    p333.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/352.png'), filename: '352.png', content_type: 'images/png');
    u334 = User.find_or_create_by(sca_name: "Aibhilin ni Dhomhnail mhic Ghiolla-Seanain") do |user|
       user.email = "aibhilin@sbcglobal.net"
       user.password = "ZnIteQrL"
       user.modern_name = "Debby Malchie-Inman"
    end
    u334 = User.find_for_authentication(email: "aibhilin@sbcglobal.net") unless u334.valid?
    unless u334.arms.attached?
      u334.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/353.gif'), filename: '353.gif', content_type: 'images/gif');
    end
    p334 = Peer.create(user: u334, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-06-24"), active: true, vigilant: false, bio: "")
    u335 = User.find_or_create_by(sca_name: "Sven of Havenholde") do |user|
       user.email = "ian.swanson.env@gmail.com"
       user.password = "uMNbIQjZ"
       user.modern_name = "Ian Swanson"
    end
    u335 = User.find_for_authentication(email: "ian.swanson.env@gmail.com") unless u335.valid?
    p335 = Peer.create(user: u335, type: 'Pelican', elevated_by: "William & Isolde",  active: true, vigilant: false, bio: "")
    u336 = User.find_or_create_by(sca_name: "Moira Eiriksdottir") do |user|
       user.email = "m.eiriksdottir@gmail.com"
       user.password = "ypMweLM7"
       user.modern_name = "Moira Chance"
    end
    u336 = User.find_for_authentication(email: "m.eiriksdottir@gmail.com") unless u336.valid?
    p336 = Peer.create(user: u336, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-09-08"), active: true, vigilant: false, bio: "")
    p336.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/355.png'), filename: '355.png', content_type: 'images/png');
    u337 = User.find_or_create_by(sca_name: "Eva van Oldebroek") do |user|
       user.email = "evavanold@gmail.com"
       user.password = "fxY3jAnT"
       user.modern_name = "Wendy Peacock"
    end
    u337 = User.find_for_authentication(email: "evavanold@gmail.com") unless u337.valid?
    unless u337.arms.attached?
      u337.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/356.gif'), filename: '356.gif', content_type: 'images/gif');
    end
    p337 = Peer.create(user: u337, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-09-23"), active: true, vigilant: false, bio: "")
    p337.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/356.png'), filename: '356.png', content_type: 'images/png');
    u338 = User.find_or_create_by(sca_name: "Aldermoureis Ventzke") do |user|
       user.email = "gabbyalda@gmail.com"
       user.password = "DMZcbUGE"
       user.modern_name = "Gabrielle Alicia Lawrence"
    end
    u338 = User.find_for_authentication(email: "gabbyalda@gmail.com") unless u338.valid?
    unless u338.arms.attached?
      u338.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/357.gif'), filename: '357.gif', content_type: 'images/gif');
    end
    p338 = Peer.create(user: u338, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-08-06"), active: true, vigilant: false, bio: "Switzerland is lovely in the 1520's but when I want simpler attire, I head earlier.

Started in the Middle Kingdom, moved to Gleann Abhann while part of Meridies, got to be part of that new kingdom, moved to Trimaris, and moved back to the Midrealm.

Enjoy heavy combat and armor, illumination and making stuff.")
    p338.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/357.png'), filename: '357.png', content_type: 'images/png');
    u339 = User.find_or_create_by(sca_name: "Zuriel Aurelius Nightshade") do |user|
       user.email = "Zuriel@oh.rr.com"
       user.password = "8EOxHVa3"
       user.modern_name = "Cindy Bank"
    end
    u339 = User.find_for_authentication(email: "Zuriel@oh.rr.com") unless u339.valid?
    unless u339.arms.attached?
      u339.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/358.gif'), filename: '358.gif', content_type: 'images/gif');
    end
    p339 = Peer.create(user: u339, type: 'Pelican', elevated_by: "William and Isolde", elevation_date: Date.parse("2017-08-09"), active: true, vigilant: false, bio: "")
    p339.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/358.png'), filename: '358.png', content_type: 'images/png');
    u340 = User.find_or_create_by(sca_name: "Christiana de Burgh") do |user|
       user.email = "kpetranek@gmail.com"
       user.password = "4zDxlbFE"
       user.modern_name = "Kristi Ross"
    end
    u340 = User.find_for_authentication(email: "kpetranek@gmail.com") unless u340.valid?
    p340 = Peer.create(user: u340, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-09-09"), active: true, vigilant: false, bio: "")
    p340.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/359.png'), filename: '359.png', content_type: 'images/png');
    u341 = User.find_or_create_by(sca_name: "Sofya Chyudskaya Smolyanina") do |user|
       user.email = "sofyachy@gmail.com"
       user.password = "99CZRYyt"
       user.modern_name = "Anne McKinney"
    end
    u341 = User.find_for_authentication(email: "sofyachy@gmail.com") unless u341.valid?
    p341 = Peer.create(user: u341, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2017-11-11"), active: true, vigilant: false, bio: "")
    p341.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/360.png'), filename: '360.png', content_type: 'images/png');
    u342 = User.find_or_create_by(sca_name: "Nadezda zeZastrizl") do |user|
       user.email = "Nadezda@MerrilMiller.com"
       user.password = "T8U2ep9G"
       user.modern_name = "Merril Miller"
    end
    u342 = User.find_for_authentication(email: "Nadezda@MerrilMiller.com") unless u342.valid?
    p342 = Peer.create(user: u342, type: 'Pelican', elevated_by: "William & Isolde", elevation_date: Date.parse("2017-10-07"), active: true, vigilant: false, bio: "")
    p342.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/361.png'), filename: '361.png', content_type: 'images/png');
    u343 = User.find_or_create_by(sca_name: "Finepopla Gunnarswif") do |user|
       user.email = "finepopla@gmail.com"
       user.password = "jowt3aqg"
       user.modern_name = "Theresa Hayes"
    end
    u343 = User.find_for_authentication(email: "finepopla@gmail.com") unless u343.valid?
    p343 = Peer.create(user: u343, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2017-12-02"), active: true, vigilant: false, bio: "")
    p343.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/362.png'), filename: '362.png', content_type: 'images/png');
    u344 = User.find_or_create_by(sca_name: "Max von Augsburg") do |user|
       user.email = "crassus700@yahoo.com"
       user.password = "2f91zMZ2"
       user.modern_name = "James G. Wallisch"
    end
    u344 = User.find_for_authentication(email: "crassus700@yahoo.com") unless u344.valid?
    p344 = Peer.create(user: u344, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2018-01-06"), active: true, vigilant: false, bio: "")
    p344.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/364.png'), filename: '364.png', content_type: 'images/png');
    u345 = User.find_or_create_by(sca_name: "Ooyama Tarou Hideyasu") do |user|
       user.email = "wolfpack48130@gmail.com"
       user.password = "KC5shMsP"
       user.modern_name = "Charles Shefferly"
    end
    u345 = User.find_for_authentication(email: "wolfpack48130@gmail.com") unless u345.valid?
    p345 = Peer.create(user: u345, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2018-01-06"), active: true, vigilant: false, bio: "")
    p345.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/365.png'), filename: '365.png', content_type: 'images/png');
    u346 = User.find_or_create_by(sca_name: "Avery Austringer") do |user|
       user.email = "Avery1415@sbcglobal.net"
       user.password = "EH3UN4Hu"
       user.modern_name = "Ted Kocot"
    end
    u346 = User.find_for_authentication(email: "Avery1415@sbcglobal.net") unless u346.valid?
    unless u346.arms.attached?
      u346.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/366.gif'), filename: '366.gif', content_type: 'images/gif');
    end
    p346 = Peer.create(user: u346, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2018-01-20"), active: true, vigilant: false, bio: "")
    p346.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/366.png'), filename: '366.png', content_type: 'images/png');
    u347 = User.find_or_create_by(sca_name: "Edmund of Hertford") do |user|
       user.email = "donstrubler@yahoo.com"
       user.password = "zfxYzmCh"
       user.modern_name = "Don Strubler"
    end
    u347 = User.find_for_authentication(email: "donstrubler@yahoo.com") unless u347.valid?
    unless u347.arms.attached?
      u347.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/367.gif'), filename: '367.gif', content_type: 'images/gif');
    end
    p347 = Peer.create(user: u347, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2018-02-03"), active: true, vigilant: false, bio: "")
    p347.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/367.png'), filename: '367.png', content_type: 'images/png');
    u348 = User.find_or_create_by(sca_name: "Wendell of Dark River") do |user|
       user.email = "Jeremiahkaha@gmail.com"
       user.password = "20mLCyam"
       user.modern_name = "Jeremiah Kaha"
    end
    u348 = User.find_for_authentication(email: "Jeremiahkaha@gmail.com") unless u348.valid?
    unless u348.arms.attached?
      u348.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/368.gif'), filename: '368.gif', content_type: 'images/gif');
    end
    p348 = Peer.create(user: u348, type: 'Pelican', elevated_by: "Cellach & Vukasin II", elevation_date: Date.parse("2018-02-24"), active: true, vigilant: false, bio: "I hail from the far Western front of the Kingdom, The Shire of Dark River in the Midlands region. Where the trade roads and rivers to Calontir & Northshield are safe and secure. My persona is a Geat farmer, and warrior. I am also a hired sword for merchants heading east to Mikelguard, and North to the Lapland areas for trade. I also do Mongolian & Kazakh too.  My students are Lady Raja of Chennai, and Lord Cartooth the Destroyer.   I have one protege who is also my Man-at-arms is Lord SigrÃkr SÃgulfson.")
    p348.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/368.png'), filename: '368.png', content_type: 'images/png');
    u349 = User.find_or_create_by(sca_name: "Lothair Glenlogan") do |user|
       user.email = "lothair.glenlogan@gmail.com"
       user.password = "VlaWrnTE"
       user.modern_name = "Christopher Reschka"
    end
    u349 = User.find_for_authentication(email: "lothair.glenlogan@gmail.com") unless u349.valid?
    p349 = Peer.create(user: u349, type: 'Pelican', elevated_by: "Seto and Ynes", elevation_date: Date.parse("2020-01-04"), active: true, vigilant: false, bio: "")
    u350 = User.find_or_create_by(sca_name: "Artemisia Laycebrayder") do |user|
       user.email = "ladyartimisia@gmail.com"
       user.password = "qt3JJKRv"
       user.modern_name = "Artie Martin"
    end
    u350 = User.find_for_authentication(email: "ladyartimisia@gmail.com") unless u350.valid?
    unless u350.arms.attached?
      u350.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/383.gif'), filename: '383.gif', content_type: 'images/gif');
    end
    p350 = Peer.create(user: u350, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    u351 = User.find_or_create_by(sca_name: "Gwynnyd of York") do |user|
       user.email = "gwynnyd@gmail.com"
       user.password = "bKuJqXMU"
       user.modern_name = "Carol Lynn"
    end
    u351 = User.find_for_authentication(email: "gwynnyd@gmail.com") unless u351.valid?
    unless u351.arms.attached?
      u351.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/384.gif'), filename: '384.gif', content_type: 'images/gif');
    end
    p351 = Peer.create(user: u351, type: 'Pelican', elevated_by: "",  active: true, vigilant: false, bio: "")
    p351.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/384.png'), filename: '384.png', content_type: 'images/png');
    u352 = User.find_or_create_by(sca_name: "Corasande of Starhill") do |user|
       user.email = "corasande@gmail.com"
       user.password = "zcy15ujC"
       user.modern_name = ""
    end
    u352 = User.find_for_authentication(email: "corasande@gmail.com") unless u352.valid?
    p352 = Peer.create(user: u352, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "")
    u353 = User.find_or_create_by(sca_name: "Andreas Blacwode") do |user|
       user.email = "baronandreas@midrealm.org"
       user.password = "wl3BQh5l"
       user.modern_name = "Drew Nicholson"
    end
    u353 = User.find_for_authentication(email: "baronandreas@midrealm.org") unless u353.valid?
    unless u353.arms.attached?
      u353.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/386.gif'), filename: '386.gif', content_type: 'images/gif');
    end
    p353 = Peer.create(user: u353, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "")
    u354 = User.find_or_create_by(sca_name: "Fiadnata o Gleann Alainn") do |user|
       user.email = "fiadnata@gmail.com"
       user.password = "Y0iq5WHV"
       user.modern_name = "Carol Reed"
    end
    u354 = User.find_for_authentication(email: "fiadnata@gmail.com") unless u354.valid?
    unless u354.arms.attached?
      u354.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/387.gif'), filename: '387.gif', content_type: 'images/gif');
    end
    p354 = Peer.create(user: u354, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "Other Awards:  
 Baroness of the Court of TRM William and Isolde -- Sept. 23, 2017 (A.S. 52)  
 Royal Augmentation of Arms: TRM Edmund and Kateryn -- March 4, 2006 (A.S. 40)  
 Order of the Evergreen (Tablet Weaving) -- January 17, 2004 (A.S. 38)  
 Order of the Dragon\'s Heart -- January 11, 1997 (A.S. 31)  
 Order of the Willow (Cooking & Cooking Research) -- July 1, 1995 (A.S. 30)  
 Award of the Purple Fret -- October 10, 1992 (A.S. 27)  
 Award of Arms -- May 8, 1982 (A.S. 17)  
  
 Order of the Flaming Brand (Flaming Gryphon) -- July 8, 2006 (A.S. 41)  
 Order of the Gryphons Plume (Flaming Gryphon) -- January 8, 2005 (A.S. 39)  
 Baronial Artisan (Flaming Gryphon) -- January 24, 2004 (A.S. 38)  
 Order of the White Wolf (Northwoods) -- October 6, 1984 (A.S. 19)")
    u355 = User.find_or_create_by(sca_name: "Victorius Suspectus, known as Vici") do |user|
       user.email = "clevelandgamer@yahoo.com"
       user.password = "6HuccL04"
       user.modern_name = "Peter Wells"
    end
    u355 = User.find_for_authentication(email: "clevelandgamer@yahoo.com") unless u355.valid?
    unless u355.arms.attached?
      u355.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/388.gif'), filename: '388.gif', content_type: 'images/gif');
    end
    p355 = Peer.create(user: u355, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "Victorius Suspectus, known as Vici   Armicustos for Vito\'s Minions. Responsible for armor, shield, and weapon fabrication and quartermaster. Retired XO from Legio Draconis command staff. Gold Mace.  Praetorian of Vito\'s Minions. Household second in command to Vito. Responsible for hosting household practices and Facebook page, safety, and training new Minion fighters for authorization.   Tall old guy with an SPQR tattoo, in either black Roman garb or plastic Roman lorica segmentata.  Arms: Gules, on a cushion argent a horse\'s head erased sable.  Mundanely a stained glass window glazer at whitneystainedglass.com  MFA in drawing, used to teach life drawing at Cleveland State University.  Lives in a cabin in the woods in Cleveland, OH.  Quotes:  We cannot increase the size of the Society with just one business model.  The only difference between someone who wants to be an armored SCA fighter and an SCA fighter is armor.")
    p355.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/388.png'), filename: '388.png', content_type: 'images/png');
    u356 = User.find_or_create_by(sca_name: "Vitus Aurelius, known as Vito") do |user|
       user.email = "M.velotta@yahoo.com"
       user.password = "81UGbLCE"
       user.modern_name = "Michael Velotta"
    end
    u356 = User.find_for_authentication(email: "M.velotta@yahoo.com") unless u356.valid?
    unless u356.arms.attached?
      u356.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/389.gif'), filename: '389.gif', content_type: 'images/gif');
    end
    p356 = Peer.create(user: u356, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "Vitus Aurelius, known as Vito. Head of household for Vito\'s Minions. Not himself a Minion, has Minions, doesn\'t like them. Self-described goddamn paterfamilias. Only recruited one guy. Retired CO of Legio Draconis, Gold Mace. Land agent for Villa Vino, the Minion camp he built. Invented couches. Makes wine, sausage, garb, and Roman gates. Has a ladies clothing line, is that Vito Couture you\'re wearing? Trains armored Minions in fundamental fighting technique and hospitality. SCA device: Gules, six towers argent, three and three, the arms of the small town in Italy from which his parents came.")
    p356.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/389.png'), filename: '389.png', content_type: 'images/png');
    u357 = User.find_or_create_by(sca_name: "Katayoun al Aurvataspa") do |user|
       user.email = "katayoun.al.aurvataspa@gmail.com"
       user.password = "FsMAGaQW"
       user.modern_name = "Donna Hofmann"
    end
    u357 = User.find_for_authentication(email: "katayoun.al.aurvataspa@gmail.com") unless u357.valid?
    p357 = Peer.create(user: u357, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "")
    u358 = User.find_or_create_by(sca_name: "Brisi Thorgrimsson") do |user|
       user.email = "jbricerobertson@gmail.com"
       user.password = "KT0GtT7l"
       user.modern_name = "James Robertson"
    end
    u358 = User.find_for_authentication(email: "jbricerobertson@gmail.com") unless u358.valid?
    unless u358.arms.attached?
      u358.arms.attach(io: File.open('lib/assets/init_images/pelican_arms/391.gif'), filename: '391.gif', content_type: 'images/gif');
    end
    p358 = Peer.create(user: u358, type: 'Pelican', elevated_by: "Seto-Heika and Reina Ynes", elevation_date: Date.parse("2020-03-07"), active: true, vigilant: false, bio: "I am a tenth century Dane living in the Danelaw area near Jorvik (modern day York) in Great Britain.   I am interested in most aspects of Viking Age history and the way of life at the time. I sew my own clothing, dabble in general metalwork and leatherwork, and have a special interest in leather turnshoes and boots of the period.")
    p358.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/391.png'), filename: '391.png', content_type: 'images/png');
    u359 = User.find_or_create_by(sca_name: "Allegra Ginevra Soave da Napoli") do |user|
       user.email = "nancyterselic@juno.com"
       user.password = "Rw8cKlVv"
       user.modern_name = "Nancy M. Terselic"
    end
    u359 = User.find_for_authentication(email: "nancyterselic@juno.com") unless u359.valid?
    p359 = Peer.create(user: u359, type: 'Pelican', elevated_by: "",  active: true, vigilant: true, bio: "")
    p359.profile_pic.attach(io: File.open('lib/assets/init_images/pelican_profile/392.png'), filename: '392.png', content_type: 'images/png');
    up2 = User.find_by(sca_name: "Dafydd Blaidd")
    unless up2.nil?
      a2 = User.find_by(sca_name: "Kyppyn Kirkcaldy")
      Dependency.create(peer: a2.pelican, superior: up2.pelican)
    end
    up13 = User.find_by(sca_name: "NONE")
    unless up13.nil?
      a13 = User.find_by(sca_name: "Andrew of Seldomrest")
      Dependency.create(peer: a13.pelican, superior: up13.pelican)
    end
    up27 = User.find_by(sca_name: "Never a protege; formerly a squire of Syr Randall d'Artinual")
    unless up27.nil?
      a27 = User.find_by(sca_name: "Caradoc Llew Du ap Morgan")
      Dependency.create(peer: a27.pelican, superior: up27.pelican)
    end
    up45 = User.find_by(sca_name: "Carlo dalla Casa")
    unless up45.nil?
      a45 = User.find_by(sca_name: "Elena de Vexin")
      Dependency.create(peer: a45.pelican, superior: up45.pelican)
    end
    up46 = User.find_by(sca_name: "Master Ioseph of Locksley")
    unless up46.nil?
      a46 = User.find_by(sca_name: "Elfleda Tarsella of Bethoc")
      Dependency.create(peer: a46.pelican, superior: up46.pelican)
    end
    up56 = User.find_by(sca_name: "Duke Eliahu ben Itzhak")
    unless up56.nil?
      a56 = User.find_by(sca_name: "Garlanda de Stanas")
      Dependency.create(peer: a56.pelican, superior: up56.pelican)
    end
    up61 = User.find_by(sca_name: "Catherine Aimee")
    unless up61.nil?
      a61 = User.find_by(sca_name: "GraziaGeralda Louisa de Navarra")
      Dependency.create(peer: a61.pelican, superior: up61.pelican)
    end
    up64 = User.find_by(sca_name: "Minna von Lubeck")
    unless up64.nil?
      a64 = User.find_by(sca_name: "Gwyneth Felton")
      Dependency.create(peer: a64.pelican, superior: up64.pelican)
    end
    up72 = User.find_by(sca_name: "Gareth Tancred Wilfrith")
    unless up72.nil?
      a72 = User.find_by(sca_name: "John of Sternfeld")
      Dependency.create(peer: a72.pelican, superior: up72.pelican)
    end
    up75 = User.find_by(sca_name: "Not a protege")
    unless up75.nil?
      a75 = User.find_by(sca_name: "Karl Ulfson")
      Dependency.create(peer: a75.pelican, superior: up75.pelican)
    end
    up77 = User.find_by(sca_name: "Countess Adelicia of Cumbria, OP, Baroness of the Court")
    unless up77.nil?
      a77 = User.find_by(sca_name: "Katharina von der Waldwiese")
      Dependency.create(peer: a77.pelican, superior: up77.pelican)
    end
    up79 = User.find_by(sca_name: "Claire Fitz William of Linwood Keep")
    unless up79.nil?
      a79 = User.find_by(sca_name: "Katherine of Sternfeld")
      Dependency.create(peer: a79.pelican, superior: up79.pelican)
    end
    up80 = User.find_by(sca_name: "Never a Protege")
    unless up80.nil?
      a80 = User.find_by(sca_name: "Kay of Tre Asterium")
      Dependency.create(peer: a80.pelican, superior: up80.pelican)
    end
    up81 = User.find_by(sca_name: "Baron Gareth Tancred of Wilfrith")
    unless up81.nil?
      a81 = User.find_by(sca_name: "Kirsten Thorsteinsdottir")
      Dependency.create(peer: a81.pelican, superior: up81.pelican)
    end
    up83 = User.find_by(sca_name: "Alexsandra  Ivanova Nemka  \"Sasha\"")
    unless up83.nil?
      a83 = User.find_by(sca_name: "Leanore de Vertearbors")
      Dependency.create(peer: a83.pelican, superior: up83.pelican)
    end
    up89 = User.find_by(sca_name: "---")
    unless up89.nil?
      a89 = User.find_by(sca_name: "Maria Teresa Ribeiro dos Santos")
      Dependency.create(peer: a89.pelican, superior: up89.pelican)
    end
    up92 = User.find_by(sca_name: "NA")
    unless up92.nil?
      a92 = User.find_by(sca_name: "Melisande of Woodcrest")
      Dependency.create(peer: a92.pelican, superior: up92.pelican)
    end
    up97 = User.find_by(sca_name: "Elevated prior to that custom")
    unless up97.nil?
      a97 = User.find_by(sca_name: "Moonwulf Starkaaderson")
      Dependency.create(peer: a97.pelican, superior: up97.pelican)
    end
    up100 = User.find_by(sca_name: "HG Palymar")
    unless up100.nil?
      a100 = User.find_by(sca_name: "Omarad the Wary")
      Dependency.create(peer: a100.pelican, superior: up100.pelican)
    end
    up130 = User.find_by(sca_name: "TEs Geoffrey of Warwick & Anne Geoffries of Warwick")
    unless up130.nil?
      a130 = User.find_by(sca_name: "Guenievre du Dragon Vert")
      Dependency.create(peer: a130.pelican, superior: up130.pelican)
    end
    up131 = User.find_by(sca_name: "â€”noneâ€”")
    unless up131.nil?
      a131 = User.find_by(sca_name: "Edward of Effingham")
      Dependency.create(peer: a131.pelican, superior: up131.pelican)
    end
    up140 = User.find_by(sca_name: "Caradoc Llew Du ap Morgan")
    unless up140.nil?
      a140 = User.find_by(sca_name: "Elysabet de Warren")
      Dependency.create(peer: a140.pelican, superior: up140.pelican)
    end
    up142 = User.find_by(sca_name: "Anne Geoffreys of Warwick and Geoffrey Warwick")
    unless up142.nil?
      a142 = User.find_by(sca_name: "Therica Pembroke of Stonegate Manor")
      Dependency.create(peer: a142.pelican, superior: up142.pelican)
    end
    up147 = User.find_by(sca_name: "Was not Protege.")
    unless up147.nil?
      a147 = User.find_by(sca_name: "Una Wynnifreed Berry")
      Dependency.create(peer: a147.pelican, superior: up147.pelican)
    end
    up149 = User.find_by(sca_name: "No one")
    unless up149.nil?
      a149 = User.find_by(sca_name: "Dafydd Blaidd")
      Dependency.create(peer: a149.pelican, superior: up149.pelican)
    end
    up153 = User.find_by(sca_name: "Squire to Sir Strykar")
    unless up153.nil?
      a153 = User.find_by(sca_name: "Malcolm MacMalcolm")
      Dependency.create(peer: a153.pelican, superior: up153.pelican)
    end
    up154 = User.find_by(sca_name: "Katherina von der Waldeweise")
    unless up154.nil?
      a154 = User.find_by(sca_name: "Malcolm Drum")
      Dependency.create(peer: a154.pelican, superior: up154.pelican)
    end
    up156 = User.find_by(sca_name: "no one - they surprised me.")
    unless up156.nil?
      a156 = User.find_by(sca_name: "Thorhalla Carlsdottir af Broberg")
      Dependency.create(peer: a156.pelican, superior: up156.pelican)
    end
    up162 = User.find_by(sca_name: "None. Former Apprentice.")
    unless up162.nil?
      a162 = User.find_by(sca_name: "Rose Marian of Edgewater")
      Dependency.create(peer: a162.pelican, superior: up162.pelican)
    end
    up163 = User.find_by(sca_name: "Cordelia Tichy")
    unless up163.nil?
      a163 = User.find_by(sca_name: "Aidan Blackstone")
      Dependency.create(peer: a163.pelican, superior: up163.pelican)
    end
    up168 = User.find_by(sca_name: "Alan Culross")
    unless up168.nil?
      a168 = User.find_by(sca_name: "Cassandra Antonelli")
      Dependency.create(peer: a168.pelican, superior: up168.pelican)
    end
    up169 = User.find_by(sca_name: "Therica Pembroke of Stonegate Manor")
    unless up169.nil?
      a169 = User.find_by(sca_name: "Julio Galva'n")
      Dependency.create(peer: a169.pelican, superior: up169.pelican)
    end
    up176 = User.find_by(sca_name: "Mistress Serena Holmes")
    unless up176.nil?
      a176 = User.find_by(sca_name: "Idonia Tait")
      Dependency.create(peer: a176.pelican, superior: up176.pelican)
    end
    up181 = User.find_by(sca_name: "Alexis MacAlister of Beverlay")
    unless up181.nil?
      a181 = User.find_by(sca_name: "Phillip the Pilgrim")
      Dependency.create(peer: a181.pelican, superior: up181.pelican)
    end
    up183 = User.find_by(sca_name: "Duchess Katherine of Sternfeld")
    unless up183.nil?
      a183 = User.find_by(sca_name: "Sigulf Karlnar")
      Dependency.create(peer: a183.pelican, superior: up183.pelican)
    end
    up192 = User.find_by(sca_name: "Viscount Sir Myles Blackheathe")
    unless up192.nil?
      a192 = User.find_by(sca_name: "Sean o'Shaughnessy")
      Dependency.create(peer: a192.pelican, superior: up192.pelican)
    end
    up200 = User.find_by(sca_name: "Mistress Anne Marie Morgaine")
    unless up200.nil?
      a200 = User.find_by(sca_name: "Katalena Ivaniaia zhena Shishova")
      Dependency.create(peer: a200.pelican, superior: up200.pelican)
    end
    up205 = User.find_by(sca_name: "Aerdigwidder von Zauberberg")
    unless up205.nil?
      a205 = User.find_by(sca_name: "Siobhan O'Neill")
      Dependency.create(peer: a205.pelican, superior: up205.pelican)
    end
    up211 = User.find_by(sca_name: "Margherita Alessia")
    unless up211.nil?
      a211 = User.find_by(sca_name: "Heirusalem Crystoma")
      Dependency.create(peer: a211.pelican, superior: up211.pelican)
    end
    up212 = User.find_by(sca_name: "Master Carlo dalla Casa")
    unless up212.nil?
      a212 = User.find_by(sca_name: "Nicholaa Halden")
      Dependency.create(peer: a212.pelican, superior: up212.pelican)
    end
    up219 = User.find_by(sca_name: "Dame Alys Katharine")
    unless up219.nil?
      a219 = User.find_by(sca_name: "Seadna O Bainainn")
      Dependency.create(peer: a219.pelican, superior: up219.pelican)
    end
    up223 = User.find_by(sca_name: "Grazia Geralda Louisa de Navarra")
    unless up223.nil?
      a223 = User.find_by(sca_name: "Ciara MacRobbie")
      Dependency.create(peer: a223.pelican, superior: up223.pelican)
    end
    up224 = User.find_by(sca_name: "Claire Fitzwilliam of Lynnwood Keep")
    unless up224.nil?
      a224 = User.find_by(sca_name: "Cathan MacCullaich")
      Dependency.create(peer: a224.pelican, superior: up224.pelican)
    end
    up226 = User.find_by(sca_name: "Duchess Garlanda de Stanas")
    unless up226.nil?
      a226 = User.find_by(sca_name: "Caelan O Roghalleach")
      Dependency.create(peer: a226.pelican, superior: up226.pelican)
    end
    up229 = User.find_by(sca_name: "Katherine of Sternfeld")
    unless up229.nil?
      a229 = User.find_by(sca_name: "Rhiannon Siobhan Shynane")
      Dependency.create(peer: a229.pelican, superior: up229.pelican)
    end
    up233 = User.find_by(sca_name: "Brise Sanguine")
    unless up233.nil?
      a233 = User.find_by(sca_name: "Morgan De'Ath")
      Dependency.create(peer: a233.pelican, superior: up233.pelican)
    end
    up234 = User.find_by(sca_name: "Mistress Cassandra Antonelli of Northshield")
    unless up234.nil?
      a234 = User.find_by(sca_name: "Acelina of Derelai")
      Dependency.create(peer: a234.pelican, superior: up234.pelican)
    end
    up235 = User.find_by(sca_name: "Garlanda de Stanas")
    unless up235.nil?
      a235 = User.find_by(sca_name: "Margarete of Stirlingshire")
      Dependency.create(peer: a235.pelican, superior: up235.pelican)
    end
    up241 = User.find_by(sca_name: "Countess Kenna")
    unless up241.nil?
      a241 = User.find_by(sca_name: "Arabella Silvermane")
      Dependency.create(peer: a241.pelican, superior: up241.pelican)
    end
    up242 = User.find_by(sca_name: "John Inchingham")
    unless up242.nil?
      a242 = User.find_by(sca_name: "Torquil MacGillavrey")
      Dependency.create(peer: a242.pelican, superior: up242.pelican)
    end
    up246 = User.find_by(sca_name: "None - Supported by many")
    unless up246.nil?
      a246 = User.find_by(sca_name: "Jean Paul Pierrepont")
      Dependency.create(peer: a246.pelican, superior: up246.pelican)
    end
    up250 = User.find_by(sca_name: "Master Fridrikr Tomasson av Knusslinghamn")
    unless up250.nil?
      a250 = User.find_by(sca_name: "Llewellyn ap Teirnon")
      Dependency.create(peer: a250.pelican, superior: up250.pelican)
    end
    up252 = User.find_by(sca_name: "Elena de Vexin")
    unless up252.nil?
      a252 = User.find_by(sca_name: "Etienne le Couteau des Roches")
      Dependency.create(peer: a252.pelican, superior: up252.pelican)
    end
    up253 = User.find_by(sca_name: "Countess Sara Penrose and Master Modius von Mergentheim")
    unless up253.nil?
      a253 = User.find_by(sca_name: "Philip White")
      Dependency.create(peer: a253.pelican, superior: up253.pelican)
    end
    up260 = User.find_by(sca_name: "Maria Teresa Ribeiro dos Santos")
    unless up260.nil?
      a260 = User.find_by(sca_name: "Sarafina Sinclair")
      Dependency.create(peer: a260.pelican, superior: up260.pelican)
    end
    up269 = User.find_by(sca_name: "Maria Teresa Ribiero dos Santos")
    unless up269.nil?
      a269 = User.find_by(sca_name: "Wilhelm Michalik")
      Dependency.create(peer: a269.pelican, superior: up269.pelican)
    end
    up270 = User.find_by(sca_name: "Brigh of Writer's Keep")
    unless up270.nil?
      a270 = User.find_by(sca_name: "Keiley Duchem")
      Dependency.create(peer: a270.pelican, superior: up270.pelican)
    end
    up272 = User.find_by(sca_name: "Robert of Griffenholm")
    unless up272.nil?
      a272 = User.find_by(sca_name: "Peregren the Lost")
      Dependency.create(peer: a272.pelican, superior: up272.pelican)
    end
    up273 = User.find_by(sca_name: "Tatiana Marana Melville")
    unless up273.nil?
      a273 = User.find_by(sca_name: "Astrid of the Yellow Rose")
      Dependency.create(peer: a273.pelican, superior: up273.pelican)
    end
    up274 = User.find_by(sca_name: "His Grace Eliahu and Her Serenity Arianna")
    unless up274.nil?
      a274 = User.find_by(sca_name: "Nezkha Kiriena Petrova")
      Dependency.create(peer: a274.pelican, superior: up274.pelican)
    end
    up281 = User.find_by(sca_name: "Gareth Ostwestly")
    unless up281.nil?
      a281 = User.find_by(sca_name: "Fergus MacPherson")
      Dependency.create(peer: a281.pelican, superior: up281.pelican)
    end
    up286 = User.find_by(sca_name: "Rory mac Feidhlimidh")
    unless up286.nil?
      a286 = User.find_by(sca_name: "Angelique d'Herisson")
      Dependency.create(peer: a286.pelican, superior: up286.pelican)
    end
    up290 = User.find_by(sca_name: "Morgan de'Ath")
    unless up290.nil?
      a290 = User.find_by(sca_name: "Francesca de Onorati")
      Dependency.create(peer: a290.pelican, superior: up290.pelican)
    end
    up291 = User.find_by(sca_name: "Acelina of Derelai")
    unless up291.nil?
      a291 = User.find_by(sca_name: "Kendra Cameron")
      Dependency.create(peer: a291.pelican, superior: up291.pelican)
    end
    up292 = User.find_by(sca_name: "Mistress Elena de Vexin")
    unless up292.nil?
      a292 = User.find_by(sca_name: "Justice McArtain")
      Dependency.create(peer: a292.pelican, superior: up292.pelican)
    end
    up301 = User.find_by(sca_name: "Midair")
    unless up301.nil?
      a301 = User.find_by(sca_name: "Giovanna Adimari")
      Dependency.create(peer: a301.pelican, superior: up301.pelican)
    end
    up302 = User.find_by(sca_name: "Maestra Marghareta Allessia")
    unless up302.nil?
      a302 = User.find_by(sca_name: "Hillary of Langeforde")
      Dependency.create(peer: a302.pelican, superior: up302.pelican)
    end
    up305 = User.find_by(sca_name: "Alexander de Seton and Maggie Cnoc Cait")
    unless up305.nil?
      a305 = User.find_by(sca_name: "Marie la Fauconniere")
      Dependency.create(peer: a305.pelican, superior: up305.pelican)
    end
    up306 = User.find_by(sca_name: "Dame Nicholaa Halden")
    unless up306.nil?
      a306 = User.find_by(sca_name: "Anton du Marais")
      Dependency.create(peer: a306.pelican, superior: up306.pelican)
    end
    up308 = User.find_by(sca_name: "Brise Sanguin")
    unless up308.nil?
      a308 = User.find_by(sca_name: "Gunnar Sigurdsson")
      Dependency.create(peer: a308.pelican, superior: up308.pelican)
    end
    up309 = User.find_by(sca_name: "Master Vorlin O'Er Gwig")
    unless up309.nil?
      a309 = User.find_by(sca_name: "Halla of Mugmort")
      Dependency.create(peer: a309.pelican, superior: up309.pelican)
    end
    up310 = User.find_by(sca_name: "Straum von Bairzog")
    unless up310.nil?
      a310 = User.find_by(sca_name: "Helena Sibylla")
      Dependency.create(peer: a310.pelican, superior: up310.pelican)
    end
    up313 = User.find_by(sca_name: "Philip the Pilgrim")
    unless up313.nil?
      a313 = User.find_by(sca_name: "Elizabethe Alles")
      Dependency.create(peer: a313.pelican, superior: up313.pelican)
    end
    up315 = User.find_by(sca_name: "Master Phillip the Pilgrim")
    unless up315.nil?
      a315 = User.find_by(sca_name: "Marissa von Atzinger")
      Dependency.create(peer: a315.pelican, superior: up315.pelican)
    end
    up316 = User.find_by(sca_name: "Sibhoan O'Neill")
    unless up316.nil?
      a316 = User.find_by(sca_name: "Alaina Blackram")
      Dependency.create(peer: a316.pelican, superior: up316.pelican)
    end
    up320 = User.find_by(sca_name: "Dag Thorgrimsson")
    unless up320.nil?
      a320 = User.find_by(sca_name: "Genoveva von Lubeck")
      Dependency.create(peer: a320.pelican, superior: up320.pelican)
    end
    up322 = User.find_by(sca_name: "Francesca")
    unless up322.nil?
      a322 = User.find_by(sca_name: "Katarina Peregine")
      Dependency.create(peer: a322.pelican, superior: up322.pelican)
    end
    up325 = User.find_by(sca_name: "Wilhelm Michalik")
    unless up325.nil?
      a325 = User.find_by(sca_name: "Roana Aldinoch")
      Dependency.create(peer: a325.pelican, superior: up325.pelican)
    end
    up328 = User.find_by(sca_name: "Hillary of Langeford")
    unless up328.nil?
      a328 = User.find_by(sca_name: "Epona Brodin")
      Dependency.create(peer: a328.pelican, superior: up328.pelican)
    end
    up329 = User.find_by(sca_name: "Sigulf Karlnar")
    unless up329.nil?
      a329 = User.find_by(sca_name: "Maggie MacKeith")
      Dependency.create(peer: a329.pelican, superior: up329.pelican)
    end
    up330 = User.find_by(sca_name: "Maggie of Cnoc Cait and Alexander de Seton")
    unless up330.nil?
      a330 = User.find_by(sca_name: "Calybrid Ine Tere")
      Dependency.create(peer: a330.pelican, superior: up330.pelican)
    end
    up332 = User.find_by(sca_name: "William of Fairhaven")
    unless up332.nil?
      a332 = User.find_by(sca_name: "Soffya von Kulpe")
      Dependency.create(peer: a332.pelican, superior: up332.pelican)
    end
    up333 = User.find_by(sca_name: "Thorvald Redhair & Margherita Alessia")
    unless up333.nil?
      a333 = User.find_by(sca_name: "Gareth Ostwestly")
      Dependency.create(peer: a333.pelican, superior: up333.pelican)
    end
    up334 = User.find_by(sca_name: "Jean Paul Pierrepont")
    unless up334.nil?
      a334 = User.find_by(sca_name: "Aibhilin ni Dhomhnail mhic Ghiolla-Seanain")
      Dependency.create(peer: a334.pelican, superior: up334.pelican)
    end
    up337 = User.find_by(sca_name: "Gyda Arnarsdottir")
    unless up337.nil?
      a337 = User.find_by(sca_name: "Eva van Oldebroek")
      Dependency.create(peer: a337.pelican, superior: up337.pelican)
    end
    up340 = User.find_by(sca_name: "Master Dafydd Blaidd")
    unless up340.nil?
      a340 = User.find_by(sca_name: "Christiana de Burgh")
      Dependency.create(peer: a340.pelican, superior: up340.pelican)
    end
    up344 = User.find_by(sca_name: "Straum")
    unless up344.nil?
      a344 = User.find_by(sca_name: "Max von Augsburg")
      Dependency.create(peer: a344.pelican, superior: up344.pelican)
    end
    up350 = User.find_by(sca_name: "Catherine Aimee le Moyne de Bretagtne")
    unless up350.nil?
      a350 = User.find_by(sca_name: "Artemisia Laycebrayder")
      Dependency.create(peer: a350.pelican, superior: up350.pelican)
    end
    up353 = User.find_by(sca_name: "Arabella")
    unless up353.nil?
      a353 = User.find_by(sca_name: "Andreas Blacwode")
      Dependency.create(peer: a353.pelican, superior: up353.pelican)
    end
    up354 = User.find_by(sca_name: "Brusten de Bearsul")
    unless up354.nil?
      a354 = User.find_by(sca_name: "Fiadnata o Gleann Alainn")
      Dependency.create(peer: a354.pelican, superior: up354.pelican)
    end
  end
end
