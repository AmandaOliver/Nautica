class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
     t.integer :cif
     t.string :name
     t.attachment :logo_url
     t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
