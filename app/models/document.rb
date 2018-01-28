class Document < ApplicationRecord
  belongs_to :peer
  belongs_to :candidate
  has_attached_file :document, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :document, :content_type => {:content_type => %w(image/gif image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
