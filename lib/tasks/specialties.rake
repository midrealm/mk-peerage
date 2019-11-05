require 'yaml'
task :specialties => :environment do
  def slug(name)
    name.downcase.gsub(' ',"_")
  end
  specialties = YAML.load_file('lib/tasks/specialties.yaml')
  specialties.each do |s|
    top = Specialty.create(name: s["name"], slug: slug(s["name"]), peerage_type: 'laurel')
    if s["sub"]
      s["sub"].each do |sub|
        top.children.create(name: sub["name"], slug: slug(sub["name"]), peerage_type: 'laurel')
      end
    end
  end
end
