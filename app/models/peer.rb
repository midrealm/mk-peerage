class Peer < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :specializations
  has_many :specialties, through: :specializations

  has_many :advocacies
  has_many :candidates, through: :advocacies

  has_many :dependencies
  has_many :superiors, through: :dependencies 

  has_attached_file :profile_pic, styles: {thumb: '100x133', large: '300x400' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def order
    type.downcase.to_sym
  end
  #helpers
  def profile_pic_data_uri
    data_uri = nil 
    if profile_pic.present?
      file_contents = Paperclip.io_adapters.for(profile_pic).read
      enc = Base64.strict_encode64(file_contents)    
      data_uri = "data:#{profile_pic_content_type};base64,#{enc}"
    end
    data_uri
  end
  def self.where_order(peerage)
    Peer.where(type: peerage.to_s.upcase)
  end

  def potential_superiors
    Peer.where(type: type).where.not(id: id)   
  end

  def self.peerage_type
    peerage_name.downcase
  end

  def self.peerage_name
    self.to_s 
  end

  def peerage_type
    self.class.peerage_type
  end

  def peerage_name
    self.class.peerage_name
  end
  def show_specialties
    specialties.where(peerage_type: peerage_name).map{|s| s.name}.to_sentence
  end

  def url
    #Parent Definition
  end

  def slug
    user.slug
  end

  def sca_name
    user.sca_name
  end
  def modern_name
    user.modern_name
  end
  def street
    user.street
  end
  def city
    user.city
  end
  def state
    user.state
  end
  def zipcode
    user.zipcode
  end
  def phone
    user.phone
  end
  def group
    user.group
  end

  def arms
    user.arms
  end
  def deceased
    user.deceased
  end
end
