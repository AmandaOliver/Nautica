class Brand < ActiveRecord::Base
    has_many :products
    validates_presence_of :name, :cif

	has_attached_file :logo_url, styles: { :medium => "125x125>", :thumb => "35x35>" }
	validates_attachment :logo_url,
	:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end
