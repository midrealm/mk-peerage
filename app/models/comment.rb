class Comment < ApplicationRecord
  belongs_to :peer
  belongs_to :candidate
end
