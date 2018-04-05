class MakeActiveForCampsTrue < ActiveRecord::Migration[5.1]
  def change
    change_column :camps, :active, :boolean, default:true  
  end
end
