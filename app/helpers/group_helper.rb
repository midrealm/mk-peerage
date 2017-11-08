module GroupHelper
  def laurel_group_url(name)
    slug = name.tr(' ', '_')
    #"/laurel/groups/#{slug}" 
    laurel_group_path(slug)
  end
  def candidate_group_url(name)
    slug = name.tr(' ', '_')
    "/chambers/groups/#{slug}" 
  end

  def laurel_link(group)
    full_group_link(group, group_path='laurel_group_path')
  end

  def candidate_link(group)
    full_group_link(group, group_path='chambers_group_path')
  end
  

  #most specific to least specific
  def full_group_link(group, group_path)
    case group.depth
    when 3
      region = group.parent.parent
      barony_link = group_link(group.settlement_type, group.parent, group_path)
      local_group_link = link_to(group.name, controller.send(group_path,[group.slug]))

      "#{local_group_link}, #{barony_link}, #{group_link(region.settlement_type, region, group_path)}".html_safe
    when 2 #Baronies or Shires
      "#{group_link(group.settlement_type, group, group_path)}, #{group_link(group.parent.settlement_type, group.parent, group_path)}".html_safe
    else #Kingdom or Region
      group_link(group.settlement_type, group, group_path).html_safe
    end  
  end

  def group_link(prefix, linked_group, group_path)
    link_to("#{prefix} of #{linked_group.name}", controller.send(group_path,[linked_group.slug]))
  end

  def candidate_region_link(group)
    region = nil
    if group.parent.group_type.name == 'Barony'
      region = group.parent.parent
    elsif group.parent.group_type.name == 'Region'
      region = group.parent
    else
      region = group
    end
      link_to region.name, candidate_group_url(region.name)
  end
end
