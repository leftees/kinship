module PeopleHelper
	def setup_person(person)
		person.birth ||= Birth.new
    person.death ||= Death.new
		person
	end

  def get_json_pedigree_tree(person)
    if person.birth.date
      birthday = person.birth.date.strftime("%-Y")
    else
      birthday = "?"
    end
    if person.death.date
      deathday = person.death.date.strftime("%-Y")
    else
      deathday = "?"
    end
    json_pedigree_tree = { :name => person.full_name, :born => birthday, :died => deathday, :location => person.birth.place.city, :parents => []}
    father = person.birth.father
    mother = person.birth.mother
    if father && !mother
      json_pedigree_tree[:parents] << get_json_pedigree_tree(father)
      json_pedigree_tree[:parents] << { :name => "Unknown", :born => "?", :died => "?" }
    end
    if mother && !father
      json_pedigree_tree[:parents] << get_json_pedigree_tree(mother)
      json_pedigree_tree[:parents] << { :name => "Unknown", :born => "?", :died => "?" }
    elsif father && mother
      json_pedigree_tree[:parents] << get_json_pedigree_tree(father)
      json_pedigree_tree[:parents] << get_json_pedigree_tree(mother)
    end
    return json_pedigree_tree
  end


end
