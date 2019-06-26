class Peer < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :specializations
  has_many :specialties, through: :specializations

  has_many :advocacies
  has_many :candidates, through: :advocacies

  has_many :dependencies
  has_many :superiors, through: :dependencies 

  has_attached_file :profile_pic, styles: {thumb: '100x133', large: '300x400' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: '/images/:style/frame.jpg'
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def order
    type.downcase.to_sym
  end
  #helpers
  def profile_pic_data_uri
    DataUriGenerator.new(profile_pic).data_uri
  end

  def specialties_link
    ApplicationController.helpers.collection_link(collection: specialties, label: 'name', order: order, url_helper: 'specialty_path')
  end

  def superiors_link
    ApplicationController.helpers.collection_link(collection: superiors, label: 'sca_name', order: order, url_helper: 'peer_path')
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
end
require_dependency 'laurel'
require_dependency 'pelican'
