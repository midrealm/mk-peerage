class Group < ApplicationRecord
  belongs_to :group_type
  has_many :users
  has_many :candidates
  has_ancestry cache_depth: true
  has_many :peers, through: :users

  def to_s
    if ancestry_depth == 3
      "#{name}, #{settlement_type} of #{self.parent.name}"
    else
      "#{self.group_type.name} of #{self.name}"
    end
  end


  def peers_of(peerage_type)
    peers.where(type: peerage_type.capitalize) 
  end
  def all_peers(peerage_type) 
    peers_of(peerage_type) + children.flat_map { |grp| grp.all_peers(peerage_type)}
  end


  def all_candidates(peerage_type)
    candidates.where(peerage_type: peerage_type.to_sym) + children.flat_map { |grp| grp.all_candidates(peerage_type.to_sym)}
  end

  def settlement_type
    group_type.name
  end
end
