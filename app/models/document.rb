class Document < ApplicationRecord
  belongs_to :peer
  belongs_to :candidate
	has_one_attached :document
  validates_presence_of :name, :document

end
