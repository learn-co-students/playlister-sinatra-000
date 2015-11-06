module Slugifiable

  module ClassMethods

	def find_by_slug(slugified_name)
      find_by(slug_name: slugified_name)
	end 

  end

  def self.included(base)
  	base.extend Slugifiable::ClassMethods
  end

  def slug
  	self.name.split(" ").map{ |e| e.downcase }.join("-")
  end	
 
end