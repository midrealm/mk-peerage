class Candidate < ApplicationRecord
  has_many :advocacies
  has_many :users, through: :advocacies

  has_many :specializations
  has_many :specialties, through: :specializations

  has_many :comments

  belongs_to :group

  has_attached_file :profile_pic, styles: {large: '300x400', thumb: '100x133' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end
end
