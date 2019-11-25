class Candidate < ApplicationRecord
  after_initialize :set_defaults
  has_many :documents, dependent: :destroy

  has_many :advocacies, dependent: :destroy
  has_many :peers, through: :advocacies

  has_many :specializations, dependent: :destroy
  has_many :specialties, through: :specializations

  has_many :comments, dependent: :destroy
  has_many :poll_results, dependent: :destroy
  has_many :advisings, dependent: :destroy

  belongs_to :group, optional: true

  validates_presence_of(:peerage_type)
  enum peerage_type: Peer.orders

  has_one_attached :profile_pic
  after_create :set_profile_pic
  after_save :enforce_parent_specialty

  #has_attached_file :profile_pic, styles: {large: '300x400', thumb: '100x133' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: '/images/:style/frame.jpg'
  #validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def set_defaults
    self.vote ||= false
  end

  def self.where_order(peerage)
    Candidate.where(peerage_type: peerage)
  end

  def last_published_poll_result
    PollResult.find_by(candidate: self, poll: Poll.last_published_for(peerage_type))
  end

  def specialties_link
    array = []
    specialties.all.each do |spec|
      array.push("<a href=\"/chambers/#{spec.peerage_type}/specialties/#{spec.slug}\">#{spec.name}</a>")
    end
    array.push specialty_detail if specialty_detail.present?
    array.join(', ').html_safe
  end

  def specialties_sentence
    array = []
    specialties.all.each do |spec|
      array.push(spec.name)
    end
    array.push specialty_detail if specialty_detail.present?
    array.join(', ')
  end
  
  def specialties?
    specialties.count > 0 || specialty_detail.present? 
  end

  def advocates_link
    ApplicationController.helpers.collection_link(collection: peers, label: 'sca_name', order: order, url_helper: 'peer_path')
  end
  
  def enforce_parent_specialty
    specs_to_add = []
    specialties.each do |s|
      if s.has_parent? && !specialties.include?(s.parent)
        specs_to_add.push(s.parent)
      end
    end
    specs_to_add.uniq.each do |s|
      Specialization.create(specialty: s, candidate: self)
    end
  end
  def profile_pic_full
    profile_pic
  end
  def profile_pic_thumb
    profile_pic.variant(combine_options: {resize: '100x133', gravity: 'South', chop: '0x33'})
  end
  def order
    peerage_type.to_sym
  end

  def list
    if vote
      'Vote'
    else
      'Watch'
    end
  end

  def set_profile_pic
		if !profile_pic.attached?
			self.profile_pic.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'frame.jpg')), filename: 'frame.jpg', content_type: 'images/jpeg')
		end
	end
end
