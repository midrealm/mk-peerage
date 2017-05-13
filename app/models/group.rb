class Group < ApplicationRecord
  belongs_to :group_type
  acts_as_tree order: 'name'
  has_many :users
  has_many :candidates
  extend ActsAsTree::TreeView

  def titled_name
    "#{self.group_type.name} of #{self.name}"
  end

  def all_laurels 
    users + children.flat_map { |grp| grp.all_laurels}
    #children.reduce(users) do |user_total, grp| 
    #  user_total.concat(grp.all_laurels)
    #end
  end

  def all_candidates
    candidates + children.flat_map { |grp| grp.all_candidates}
  end
end
