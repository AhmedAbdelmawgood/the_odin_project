class Article < ActiveRecord::Base
	def tag_list
		tags.join(', ')
	end
	def tag_list=(string)
		tags = string.split(",").collect! {|x| x.strip.downcase}.uniq
		all_the_tags = tags.collect {|name| Tag.find_or_create_by(name: name)}
		self.tags = all_the_tags
	end

	has_many :comments	
	has_many :taggings
	has_many :tags, through: :taggings
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
