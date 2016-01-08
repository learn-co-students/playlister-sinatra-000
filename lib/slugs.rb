module Slugs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    ###better way involving a more specific query right to the db rather than unslugging?
    find_me = slug.split("-").map{|j| j.capitalize}.join(" ")
    Artist.find_by name: find_me
  end

end