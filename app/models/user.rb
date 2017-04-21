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

  has_attached_file :arms, styles: {small: '100x100', med: '200x200', large: '500x500' }
  has_attached_file :profile_pic, styles: {small: '100x100', med: '200x200', large: '500x500' }
  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum role: [ :admin, :normal ]
  after_initialize :set_defaults

  def set_defaults
    self.role ||= :normal
  end

  def slug
    return self.sca_name.tr(' ', '_')
  end  

  def url
    return "/laurels/#{self.slug}"
  end

  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end
end
