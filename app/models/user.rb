class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable 
 
  #for adding new peers 
  attr_accessor :vigilant

  has_many :peers
  Peer.orders.each do |peerage|
    has_one peerage
    accepts_nested_attributes_for peerage
  end
  
  has_many :comments

  belongs_to :group

  has_attached_file :arms, styles: {large: '100x200'}, default_url: ':style/no_arms.jpg'
  validates_attachment_content_type :arms, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :email, format: /.+@.+\..+/i
  validates_presence_of :sca_name

  before_save :set_slug, :set_deceased

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
    data_uri = nil 
    if arms.present?
      file_contents = Paperclip.io_adapters.for(arms.styles[:large]).read
      enc = Base64.strict_encode64(file_contents)    
      data_uri = "data:#{arms_content_type};base64,#{enc}"
    end
    data_uri
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
