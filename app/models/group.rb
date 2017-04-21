class Group < ApplicationRecord
  belongs_to :group_type
  acts_as_tree order: 'name'
  has_many :users
  has_many :candidates
  extend ActsAsTree::TreeView

  def titled_name
    "#{self.group_type.name} of #{self.name}"
  end
end
