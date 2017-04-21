require 'yaml'
task :groups => :environment do
  def branch(grp, rt)
    grp_type =  GroupType.find_or_create_by(name: grp['type'])
    r = rt.children.create(name: grp['name'], group_type: grp_type); 
    if grp['groups']
      grp['groups'].each do |subgrp|
        branch(subgrp, r) 
      end
    end
  end

  groups = YAML.load_file('lib/tasks/middle_groups.yaml')
  
  groups.each do |group|
    grp_type =  GroupType.find_or_create_by(name: group['type'])
    root = Group.create(name: group['name'], group_type: grp_type); 
    if group['groups']
      group['groups'].each do |subgroup|
        branch(subgroup, root) 
      end
    end
  end
end
