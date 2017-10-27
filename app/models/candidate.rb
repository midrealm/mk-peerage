class Candidate < ApplicationRecord
  after_initialize :set_defaults
  has_many :images

  has_many :advocacies
  has_many :peers, through: :advocacies

  has_many :specializations
  has_many :specialties, through: :specializations

  has_many :comments
  has_many :poll_results

  belongs_to :group

  has_attached_file :profile_pic, styles: {large: '300x400', thumb: '100x133' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def set_defaults
    self.vote ||= false
  end

  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end

  def poll_entry_submitted?(user)
    if(Poll.last.active?)
      advising = Advising.find_by(candidate: self, peer: user.peer, 
        poll: Poll.last, submitted: true)
      if advising.nil?
        return false
      else
        return true
      end
    end  
  end
end
