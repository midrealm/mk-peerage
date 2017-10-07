class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable 

  has_many :specializations
  has_many :specialties, through: :specializations
  
  has_many :comments

  has_many :advocacies
  has_many :candidates, through: :advocacies

  has_many :apprenticeships
  has_many :laurels, through: :apprenticeships

  has_many :peers #meaning peerages
  has_one :laurel
  accepts_nested_attributes_for :laurel

  has_one :knight
  accepts_nested_attributes_for :knight

  has_one :pelican
  accepts_nested_attributes_for :pelican

  has_one :defense
  accepts_nested_attributes_for :defense
 
  belongs_to :group

  #has_many :apprentice_users, through: :apprenticeships, source: :user

  has_attached_file :arms, styles: {large: '100x200'}, default_url: ':style/no_arms.jpg'
#  has_attached_file :profile_pic, styles: {thumb: '100x133', large: '300x400' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
#  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #enum role: [ :admin, :normal ]
  after_initialize :set_defaults
  before_save :set_slug, :set_deceased

  def set_defaults
    #self.role ||= :normal
  end

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

  private
  def set_slug
    self.slug = I18n.transliterate(self.sca_name).downcase.tr(' ','_')
  end

  def set_deceased
    self.active = false if self.deceased
  end
end
