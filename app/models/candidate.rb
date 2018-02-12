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

  belongs_to :group

  validates_presence_of(:peerage_type)
  enum peerage_type: Peer.orders

  has_attached_file :profile_pic, styles: {large: '300x400', thumb: '100x133' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def set_defaults
    self.vote ||= false
  end

  def specialties_link
    ApplicationController.helpers.collection_link(specialties){|x|[x.name, Rails.application.routes.url_helpers.chambers_specialty_path(order, x.slug)]}
  end

  def advocates_link
    ApplicationController.helpers.collection_link(peers){|x|[x.sca_name, Rails.application.routes.url_helpers.peer_path(order, x.slug)]}
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

end
