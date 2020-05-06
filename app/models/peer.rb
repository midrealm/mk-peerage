class Peer < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :specializations
  has_many :specialties, through: :specializations

  has_many :advocacies
  has_many :candidates, through: :advocacies

  has_many :dependencies
  has_many :superiors, through: :dependencies 

  has_one_attached :profile_pic
  after_create :set_profile_pic
 # has_attached_file :profile_pic, styles: {thumb: '100x133', large: '300x400' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: '/images/:style/frame.jpg'
 # validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def order
    type.downcase.to_sym
  end

  def order_title
    self.class.order_title
  end

  #helpers
  def profile_pic_data_uri
    "data:image/jpeg;base64,#{Base64.strict_encode64(profile_pic.blob.download)}"
  end

  def profile_pic_full
    profile_pic
  end

  def profile_pic_thumb
    profile_pic.variant(combine_options: {resize: '100x133', gravity: 'South', chop: '0x33'})
  end

  def specialties_link
    array = []
    specialties.each do |spec|
      array.push("<a href=\"/#{spec.peerage_type}/specialties/#{spec.slug}\">#{spec.name}</a>")
    end
    array.push specialty_detail if specialty_detail.present?
    array.join(', ').html_safe
  end

  def specialties_sentence
    array = []
    specialties.each do |spec|
      array.push(spec.name)
    end
    array.push specialty_detail if specialty_detail.present?
    array.join(', ')
  end
 
  def self.specialties_on? 
    true
  end

  def specialties_on?
    self.class.specialties_on?
  end  

  def specialties?
   specialties.count > 0 || specialty_detail.present? 
  end
  def superiors_link
    ApplicationController.helpers.collection_link(collection: superiors, label: 'sca_name', order: order, url_helper: 'peer_path')
  end

  def specialties_suffix
    if specialties?
      "(#{specialties_sentence})" 
    else
      ""
    end
  end

  def self.subclass(peerage) 
    peerage.to_s.capitalize.constantize
  end

  def self.orders
    Peer.subclasses.map{|x| x.name.downcase.to_sym}
  end 
  def self.where_order(peerage)
    Peer.where(type: peerage.to_s.capitalize)
  end
  def self.active(peerage)
    Peer.where_order(peerage).select{ |p| p.active? }
  end
	def self.news_last_updated(peerage)
		News.find_by(peerage_type: peerage)&.updated_at&.strftime('%d-%B-%Y')
	end
	def self.news_body(peerage)
		News.find_by(peerage_type: peerage)&.body || ''
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

  def self.mailing_list
    #parent definition
  end

  def self.collection
    #parent definition
  end
  def self.dependent_name
    #parent definition
  end
  def dependent_name
    self.class.dependent_name.capitalize
  end
  def peerage_type
    self.class.peerage_type
  end

  def peerage_name
    self.class.peerage_name
  end

  def email
    user.email
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
  def set_profile_pic
		if !profile_pic.attached?
			self.profile_pic.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'frame.jpg')), filename: 'frame.jpg', content_type: 'images/jpeg')
		end
	end
end
require_dependency 'laurel'
require_dependency 'pelican'
