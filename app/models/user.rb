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
 
  belongs_to :group

  #has_many :apprentice_users, through: :apprenticeships, source: :user

  has_attached_file :arms, styles: {large: '100x200'}, default_url: ':style/no_arms.jpg'
  has_attached_file :profile_pic, styles: {thumb: '100x133', large: '300x400' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum role: [ :admin, :normal ]
  after_initialize :set_defaults
  before_save :set_slug, :set_deceased

  def set_defaults
    self.role ||= :normal
  end

  def url
    return "/laurels/#{self.slug}"
  end

  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end

  private
  def set_slug
    self.slug = I18n.transliterate(self.sca_name).downcase.tr(' ','_')
  end

  def set_deceased
    self.active = false if self.deceased
  end
end
