module FindBySlug

	def find_by_slug(slug)
		names = slug.split('-')
		names.collect! do |name|
			name.capitalize
		end
		name = names.join(' ')
		self.all.each do |item|
			if item.name == name
				return item
			end
		end
	end

end