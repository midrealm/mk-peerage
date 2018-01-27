class Dependency < ApplicationRecord
  belongs_to :peer
  belongs_to :superior, class_name: "Peer"
end
