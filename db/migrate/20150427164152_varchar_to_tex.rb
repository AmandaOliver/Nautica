class VarcharToTex < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :description, :text, :null => true 
    end
  end
 
  def down
    change_table :products do |t|
      t.change :description, :text
    end
  end
end
