module GroupHelper

  def peer_link(group, peerage)
    full_group_link(group, "group_path", peerage)
  end

  def candidate_link(group, peerage)
    full_group_link(group, "chambers_group_path", peerage)
  end
  

  #most specific to least specific
  def full_group_link(group, group_path, peerage)
    case group.depth
    when 3
      region = group.parent.parent
      barony_link = group_link(group.settlement_type, group.parent, group_path, peerage)
      local_group_link = link_to(group.name, controller.send(group_path,peerage, group.slug))

      "#{local_group_link}, #{barony_link}, #{group_link(region.settlement_type, region, group_path, peerage)}".html_safe
    when 2 #Baronies or Shires
      "#{group_link(group.settlement_type, group, group_path, peerage)}, #{group_link(group.parent.settlement_type, group.parent, group_path, peerage)}".html_safe
    else #Kingdom or Region
      group_link(group.settlement_type, group, group_path, peerage).html_safe
    end  
  end

  def group_link(prefix, linked_group, group_path, peerage)
    link_to("#{prefix} of #{linked_group.name}", controller.send(group_path,peerage, linked_group.slug))
  end

  def candidate_region_link(group, peerage)
    if group.depth == 1
      link_to group.name, chambers_group_path(peerage.to_s,group.slug) 
    else
      region = group.ancestors.at_depth(1).first
      link_to region.name, chambers_group_path(peerage.to_s,region.slug) 
   end 
  end
end
