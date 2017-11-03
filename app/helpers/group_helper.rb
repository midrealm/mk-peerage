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

  #most specific to least specific
  def laurel_link(group)
    if group.root?
      link_to("Kingdom of #{group.name}", laurel_group_url(group.name))
    else 
       case group.parent.group_type.name 
       when 'Barony' #dealing with Cantons
          region = group.parent.parent
          region_link = link_to("Region of #{region.name}", laurel_group_url(region.name))
          barony_link = link_to("#{group.group_type.name} of #{group.parent.name}", laurel_group_url(group.parent.name))
          group_link = link_to(group.name, laurel_group_url(group.name))
          group_link + ', '+ barony_link + ', ' + region_link
        when 'Region' #mostly Baronies or Shires
          link_to("#{group.group_type.name} of #{group.name}", laurel_group_url(group.name)) + ', ' + 
          link_to("#{group.parent.group_type.name} of #{group.parent.name}", laurel_group_url(group.parent.name))
        else #regions
          link_to("#{group.group_type.name} of #{group.name}", laurel_group_url(group.name))
        end
    end  
  end

  def candidate_link(group)
    if group.parent.group_type.name == 'Barony'
      region = group.parent.parent
      region_link = link_to("Region of #{region.name}", candidate_group_url(region.name))
      barony_link = link_to("#{group.group_type.name} of #{group.parent.name}", candidate_group_url(group.parent.name))
      group_link = link_to(group.name, candidate_group_url(group.name))
      group_link + ', '+ barony_link + ', ' + region_link
    elsif group.parent.group_type.name == 'Region'
      link_to("#{group.group_type.name} of #{group.name}", candidate_group_url(group.name)) + ', ' + 
      link_to("Region of #{group.parent.name}", candidate_group_url(group.parent.name))
    else
      link_to("#{group.group_type.name} of #{group.name}", candidate_group_url(group.name))
    end
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
