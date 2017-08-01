class Product < ActiveRecord::Base
	belongs_to :brand
	validates_presence_of :brand_id, :name, :price

	has_attached_file :product_img, styles: { :medium => "125x125>", :thumb => "35x35>" },
	:default_url => "missing_:style.png"
	validates_attachment :product_img,
	:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

	def self.latest(num)
		all.order("products.id desc").includes(:brand).limit(num)
	end

	def self.search(search)
		if search
			where("name LIKE ?", "%#{search}%")
		end
	end
end
