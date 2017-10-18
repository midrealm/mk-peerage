class Peer < ApplicationRecord
  belongs_to :user

  has_attached_file :profile_pic, styles: {thumb: '100x133', large: '300x400' }, convert_options: { thumb: '-gravity South -chop 0x33' }, default_url: ':style/frame.jpg'
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def profile_pic_data_uri
    data_uri = nil 
    if profile_pic.present?
      file_contents = Paperclip.io_adapters.for(profile_pic).read
      enc = Base64.strict_encode64(file_contents)    
      data_uri = "data:#{profile_pic_content_type};base64,#{enc}"
    end
    data_uri
  end
end
