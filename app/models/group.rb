class Group < ApplicationRecord
  belongs_to :group_type
  has_many :users
  has_many :candidates
  has_ancestry cache_depth: true

  def to_s
    if ancestry_depth == 3
      "#{name}, #{settlement_type} of #{self.parent.name}"
    else
      "#{self.group_type.name} of #{self.name}"
    end
  end


  def all_peers(peerage_type) 
    users.joins(:peers).where(peers: {type: peerage_type.capitalize}) + children.flat_map { |grp| grp.all_peers(peerage_type)}
  end


  def all_candidates
    candidates + children.flat_map { |grp| grp.all_candidates}
  end

  def settlement_type
    group_type.name
  end
end
