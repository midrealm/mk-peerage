class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
 
  #for adding new peers 
  attr_accessor :vigilant

  has_many :peers
  Peer.orders.each do |peerage|
    has_one peerage
    accepts_nested_attributes_for peerage
  end
  
  has_many :comments

  belongs_to :group, optional: true

  has_one_attached :arms
  #has_attached_file :arms, styles: {large: '100x200'}, default_url: '/images/:style/no_arms.jpg'
#  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :email, format: /.+@.+\..+/i
  validates_presence_of :sca_name

  before_save :set_slug, :set_deceased
  after_save :enforce_parent_specialty
	after_create :set_arms

  scope :all_except, -> (peerage) { User.where.not(id: Peer.all.where(type: peerage.to_s.capitalize).joins(:user).pluck('users.id')) }

  def peer(peerage)
    p_type = peerage.to_s.capitalize
    peers.find_by(type: p_type) 
  end

  def self.add_new(id:, sca_name:, email:, vigilant: true, peerage:)
    vigilant = true if vigilant.nil?
    user = User.find_or_initialize_by(id: id)
    if user.id.nil?
      pwd = Devise.friendly_token.first(8)  
      user.password = pwd 
      user.assign_attributes(sca_name: sca_name, email: email)
    end
    if user.save and user.peer(peerage).nil?
      Peer.subclass(peerage).create(user: user, active: true, vigilant: vigilant) 
    end
    user
  end

  def arms_data_uri
    "data:image/jpeg;base64,#{Base64.strict_encode64(arms.variant(resize: "100x200").blob.download)}"
  end

  private
  def set_slug
    self.slug = I18n.transliterate(self.sca_name).downcase.tr(' ','_')
  end
  def enforce_parent_specialty
    self.peers.all.each do |peer|
        specs_to_add = []
        specs = peer.specialties.all
        specs.each do |s|
          if s.has_parent? && !specs.include?(s.parent)
            specs_to_add.push(s.parent) 
          end
        end
      
        specs_to_add.uniq.each do |s|
          Specialization.create(specialty: s, peer: peer)
        end
      end
  end

  def set_deceased
    if deceased
      peers.each do |p|
        p.update(active: false)
      end
    end
  end
  def set_arms
		if !arms.attached?
			self.arms.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'no_arms.jpg')), filename: 'no_arms.jpg', content_type: 'images/jpeg')
		end
	end

end
