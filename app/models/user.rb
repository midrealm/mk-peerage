class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable 
 
  #for adding new peers 
  attr_accessor :vigilant

  has_many :peers
  has_one :laurel
  has_one :pelican
  accepts_nested_attributes_for :laurel
  accepts_nested_attributes_for :pelican
  
  has_many :comments

  belongs_to :group

  has_attached_file :arms, styles: {large: '100x200'}, default_url: ':style/no_arms.jpg'
  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :email, format: /.+@.+\..+/i
  validates_presence_of :sca_name

  before_save :set_slug, :set_deceased

  scope :all_except_peerage, -> (peerage) { User.where.not(id: Peer.all.where(type: peerage.to_s.capitalize).joins(:user).pluck('users.id')) }

  def url
    return "/laurels/#{self.slug}"
  end

  
  def polle_complete?
    if Poll.last.active?
      poll = Poll.last
      incomplete = false
      Candidate.all.each do |cand|
        advising = poll.advisings.find_by(peer: self.peer, candidate_id: cand.id, submitted: true)  
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
        advising = poll.advisings.find_by(peer: self.peers.first, candidate_id: cand.id, submitted: true)  
        count = count + 1 unless advising.nil?
      end
      return count
    else
      return 0
    end
  end

  def peer(peerage)
    p_type = peerage.to_s.capitalize
    peers.find_by(type: p_type) 
  end

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

  def peer?
    !peer.nil?
  end


  private
  def set_slug
    self.slug = I18n.transliterate(self.sca_name).downcase.tr(' ','_')
  end

  def set_deceased
    if deceased
      peers.each do |p|
        p.update(active: false)
      end
    end
  end
end
