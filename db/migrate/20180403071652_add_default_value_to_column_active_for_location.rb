class AddDefaultValueToColumnActiveForLocation < ActiveRecord::Migration[5.1]
  def change
    change_column :locations, :active, :boolean, default:true  
  end
end
