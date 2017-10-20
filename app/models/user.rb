class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable 
  
  has_one :peer
  accepts_nested_attributes_for :peer

  has_many :specializations
  has_many :specialties, through: :specializations
  
  has_many :comments

  has_many :advocacies
  has_many :candidates, through: :advocacies

  has_many :apprenticeships
  has_many :laurels, through: :apprenticeships
 
  belongs_to :group

  #has_many :apprentice_users, through: :apprenticeships, source: :user

  has_attached_file :arms, styles: {large: '100x200'}, default_url: ':style/no_arms.jpg'
  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #enum role: [ :normal, :admin ]
  #after_initialize :set_defaults
  before_save :set_slug, :set_deceased


  #def set_defaults
  #  self.role ||= :normal
  #end

  def url
    return "/laurels/#{self.slug}"
  end

  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end

  def poll_complete?
    if Poll.last.active?
      poll = Poll.last
      incomplete = false
      Candidate.all.each do |cand|
        advising = poll.advisings.find_by(user_id: self.id, candidate_id: cand.id, submitted: true)  
        if advising.nil?
          incomplete = true
          break  
        end 
      end
      if incomplete
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def poll_submitted_count
    if Poll.last.active?
      count = 0
      poll = Poll.last
      Candidate.all.each do |cand|
        advising = poll.advisings.find_by(user_id: self.id, candidate_id: cand.id, submitted: true)  
        count = count + 1 unless advising.nil?
      end
      return count
    else
      return 0
    end
  end

  ##temporary forwarding methods
  def elevators
    peer.elevated_by
  end
  def active
    peer.active
  end
  #screws up #inspect in console for royals
  def vigilant
    peer.vigilant
  end
  def elevation_date
    peer.elevation_date
  end
  def bio
    peer.bio
  end
  def profile_pic
    peer.profile_pic
  end
  def apprenticed_to
    peer.apprenticed_to
  end
  #also screws up inspect for royals
  def role
    if peer.admin
      "admin"
    else
      "normal"
    end
  end
  def admin?
    peer.admin unless peer.nil?
  end
  def normal?
    !peer.admin
  end
  def specialty_detail
    peer.specialty_detail
  end
  def specialties
    peer.specialties
  end

  #def laurel
  #  peer.exist?
  #end
  def peer?
    !peer.nil?
  end

  private
  def set_slug
    self.slug = I18n.transliterate(self.sca_name).downcase.tr(' ','_')
  end

  def set_deceased
    peer.update(active: false) if deceased
  end
end
