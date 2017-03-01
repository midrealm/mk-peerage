class Candidate < ApplicationRecord
  has_many :advocacies
  has_many :users, through: :advocacies

  has_many :specializations
  has_many :specialties, through: :specializations

  has_many :comments

  has_attached_file :profile_pic, styles: {small: '100x100', med: '200x200', large: '500x500' }
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end
end
