class Apprenticeship < ApplicationRecord
  belongs_to :user
  belongs_to :laurel, class_name: "User"
end
